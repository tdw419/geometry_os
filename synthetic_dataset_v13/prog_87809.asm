; DESCRIPTION: Composite: Places a purple line segment connecting (353, 215) to (14, 126) then Places a blue circle of radius 72 at center (174, 89).
; PLAN: r0=353(x1), r1=215(y1), r2=14(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=89(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 215
LDI r2, 14
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 89
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
