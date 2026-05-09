; DESCRIPTION: Composite: Places a purple line segment connecting (97, 164) to (309, 42) then Places a blue circle of radius 25 at center (95, 87).
; PLAN: r0=97(x1), r1=164(y1), r2=309(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=87(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 164
LDI r2, 309
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 87
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
