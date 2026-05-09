; DESCRIPTION: Composite: Renders a yellow box of size 67x51 starting at (339, 143) then Sets a single orange pixel at (180, 30) then Creates a green circular shape at (175, 177) with radius 75.
; PLAN: r0=339(x), r1=143(y), r2=67(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=175(x), r11=177(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 143
LDI r2, 67
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 175
LDI r11, 177
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
