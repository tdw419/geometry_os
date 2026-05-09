; DESCRIPTION: Composite: Places a blue line segment connecting (104, 122) to (462, 98) then Creates a black rectangular region at (263, 110) spanning 78 by 26 pixels then Places a magenta dot at position (235, 171).
; PLAN: r0=104(x1), r1=122(y1), r2=462(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=110(y), r7=78(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=235(x), r11=171(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 104
LDI r1, 122
LDI r2, 462
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 110
LDI r7, 78
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 171
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
