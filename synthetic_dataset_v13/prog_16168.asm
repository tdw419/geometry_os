; DESCRIPTION: Composite: Places a white dot at position (426, 14) then Renders a orange line between points (85, 91) and (146, 225) then Renders a magenta box of size 33x29 starting at (13, 16).
; PLAN: r0=426(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=91(y1), r7=146(x2), r8=225(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=16(y), r12=33(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 91
LDI r7, 146
LDI r8, 225
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 16
LDI r12, 33
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
