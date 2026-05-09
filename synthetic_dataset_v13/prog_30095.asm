; DESCRIPTION: Composite: Places a black line segment connecting (19, 219) to (397, 137) then Places a magenta 91x110 rectangle at position (176, 77).
; PLAN: r0=19(x1), r1=219(y1), r2=397(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=77(y), r7=91(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 219
LDI r2, 397
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 77
LDI r7, 91
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
