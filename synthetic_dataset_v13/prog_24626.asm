; DESCRIPTION: Composite: Draws a cyan circle centered at (217, 219) with radius 37 then Places a white line segment connecting (237, 137) to (9, 0).
; PLAN: r0=217(x), r1=219(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=137(y1), r7=9(x2), r8=0(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 219
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 137
LDI r7, 9
LDI r8, 0
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
