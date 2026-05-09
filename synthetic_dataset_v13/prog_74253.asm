; DESCRIPTION: Composite: Renders a green line between points (235, 157) and (53, 76) then Draws a green circle centered at (302, 178) with radius 34 then Creates a cyan rectangular region at (303, 14) spanning 120 by 33 pixels.
; PLAN: r0=235(x1), r1=157(y1), r2=53(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=178(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x), r11=14(y), r12=120(width), r13=33(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 157
LDI r2, 53
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 178
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 14
LDI r12, 120
LDI r13, 33
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
