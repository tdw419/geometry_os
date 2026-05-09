; DESCRIPTION: Composite: Creates a white rectangular region at (77, 108) spanning 48 by 103 pixels then Sets a single purple pixel at (306, 230) then Draws a green circle centered at (168, 81) with radius 32.
; PLAN: r0=77(x), r1=108(y), r2=48(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=230(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=81(y), r12=32(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 108
LDI r2, 48
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 230
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 81
LDI r12, 32
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
