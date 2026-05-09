; DESCRIPTION: Composite: Places a black circle of radius 34 at center (402, 191) then Draws a purple line from (361, 121) to (70, 200).
; PLAN: r0=402(x), r1=191(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x1), r6=121(y1), r7=70(x2), r8=200(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 191
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 121
LDI r7, 70
LDI r8, 200
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
