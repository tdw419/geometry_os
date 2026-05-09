; DESCRIPTION: Composite: Draws a blue line from (46, 176) to (50, 163) then Sets a single cyan pixel at (193, 209).
; PLAN: r0=46(x1), r1=176(y1), r2=50(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=209(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 176
LDI r2, 50
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 209
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
