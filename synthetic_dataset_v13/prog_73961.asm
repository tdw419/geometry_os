; DESCRIPTION: Composite: Places a blue circle of radius 73 at center (423, 128) then Renders a green line between points (292, 46) and (15, 90).
; PLAN: r0=423(x), r1=128(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x1), r6=46(y1), r7=15(x2), r8=90(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 128
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 46
LDI r7, 15
LDI r8, 90
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
