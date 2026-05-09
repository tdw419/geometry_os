; DESCRIPTION: Composite: Renders a white box of size 44x75 starting at (254, 166) then Sets a single orange pixel at (56, 224) then Renders a orange line between points (111, 177) and (176, 175).
; PLAN: r0=254(x), r1=166(y), r2=44(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=224(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=111(x1), r11=177(y1), r12=176(x2), r13=175(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 166
LDI r2, 44
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 224
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 111
LDI r11, 177
LDI r12, 176
LDI r13, 175
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
