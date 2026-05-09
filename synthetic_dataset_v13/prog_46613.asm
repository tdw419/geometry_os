; DESCRIPTION: Composite: Creates a green rectangular region at (380, 68) spanning 95 by 116 pixels then Places a magenta circle of radius 49 at center (175, 121) then Places a blue dot at position (229, 209).
; PLAN: r0=380(x), r1=68(y), r2=95(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=121(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x), r11=209(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 68
LDI r2, 95
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 121
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 209
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
