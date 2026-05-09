; DESCRIPTION: Composite: Renders a white line between points (452, 96) and (213, 176) then Renders a purple box of size 37x30 starting at (254, 113) then Renders a magenta disk with center (283, 205) and radius 34.
; PLAN: r0=452(x1), r1=96(y1), r2=213(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=113(y), r7=37(width), r8=30(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x), r11=205(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 452
LDI r1, 96
LDI r2, 213
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 113
LDI r7, 37
LDI r8, 30
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 205
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
