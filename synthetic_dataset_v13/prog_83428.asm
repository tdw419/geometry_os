; DESCRIPTION: Composite: Creates a black circular shape at (245, 222) with radius 22 then Renders a yellow box of size 117x44 starting at (353, 44) then Sets a single white pixel at (447, 121).
; PLAN: r0=245(x), r1=222(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=44(y), r7=117(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x), r11=121(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 222
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 44
LDI r7, 117
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 121
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
