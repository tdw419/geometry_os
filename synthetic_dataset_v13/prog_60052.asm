; DESCRIPTION: Composite: Places a yellow dot at position (324, 199) then Creates a green rectangular region at (28, 168) spanning 61 by 88 pixels then Places a black circle of radius 74 at center (211, 152).
; PLAN: r0=324(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=168(y), r7=61(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x), r11=152(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 28
LDI r6, 168
LDI r7, 61
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 152
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
