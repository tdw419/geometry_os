; DESCRIPTION: Composite: Renders a cyan line between points (353, 92) and (9, 208) then Places a cyan dot at position (48, 3).
; PLAN: r0=353(x1), r1=92(y1), r2=9(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=3(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 92
LDI r2, 9
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 3
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
