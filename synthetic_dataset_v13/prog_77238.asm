; DESCRIPTION: Composite: Renders a blue line between points (16, 27) and (58, 39) then Sets a single cyan pixel at (308, 214).
; PLAN: r0=16(x1), r1=27(y1), r2=58(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=214(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 16
LDI r1, 27
LDI r2, 58
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 214
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
