; DESCRIPTION: Composite: Sets a single white pixel at (210, 217) then Draws a blue rectangle at (291, 94) with width 55 and height 115 then Draws a white circle centered at (79, 169) with radius 24.
; PLAN: r0=210(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=94(y), r7=55(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x), r11=169(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 210
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 94
LDI r7, 55
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 169
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
