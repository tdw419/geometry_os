; DESCRIPTION: Composite: Renders a cyan disk with center (183, 84) and radius 67 then Draws a purple line from (459, 224) to (257, 137).
; PLAN: r0=183(x), r1=84(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=224(y1), r7=257(x2), r8=137(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 84
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 224
LDI r7, 257
LDI r8, 137
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
