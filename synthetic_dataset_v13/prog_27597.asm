; DESCRIPTION: Composite: Creates a cyan rectangular region at (98, 107) spanning 43 by 103 pixels then Renders a black line between points (138, 253) and (229, 78) then Draws a green circle centered at (302, 82) with radius 73.
; PLAN: r0=98(x), r1=107(y), r2=43(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x1), r6=253(y1), r7=229(x2), r8=78(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=82(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 107
LDI r2, 43
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 253
LDI r7, 229
LDI r8, 78
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 82
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
