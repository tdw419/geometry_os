; DESCRIPTION: Composite: Places a cyan line segment connecting (138, 7) to (36, 6) then Creates a magenta rectangular region at (55, 122) spanning 115 by 91 pixels then Creates a cyan circular shape at (82, 167) with radius 71.
; PLAN: r0=138(x1), r1=7(y1), r2=36(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=122(y), r7=115(width), r8=91(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=167(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 7
LDI r2, 36
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 122
LDI r7, 115
LDI r8, 91
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 167
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
