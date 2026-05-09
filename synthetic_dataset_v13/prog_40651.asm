; DESCRIPTION: Composite: Renders a magenta box of size 110x52 starting at (373, 189) then Places a green dot at position (370, 9) then Places a magenta circle of radius 17 at center (355, 47).
; PLAN: r0=373(x), r1=189(y), r2=110(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=9(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=47(y), r12=17(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 189
LDI r2, 110
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 9
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 355
LDI r11, 47
LDI r12, 17
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
