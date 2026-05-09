; DESCRIPTION: Composite: Renders a green line between points (258, 100) and (104, 68) then Renders a purple box of size 35x68 starting at (217, 140).
; PLAN: r0=258(x1), r1=100(y1), r2=104(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=140(y), r7=35(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 100
LDI r2, 104
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 140
LDI r7, 35
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
