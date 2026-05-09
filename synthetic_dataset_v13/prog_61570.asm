; DESCRIPTION: Composite: Creates a white rectangular region at (216, 142) spanning 72 by 105 pixels then Places a green line segment connecting (57, 115) to (267, 226) then Draws a white circle centered at (151, 87) with radius 71.
; PLAN: r0=216(x), r1=142(y), r2=72(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x1), r6=115(y1), r7=267(x2), r8=226(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=87(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 142
LDI r2, 72
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 115
LDI r7, 267
LDI r8, 226
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 87
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
