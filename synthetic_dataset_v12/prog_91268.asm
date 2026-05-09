; DESCRIPTION: Composite: Places a magenta dot at position (205, 175) then Renders a cyan line between points (308, 141) and (99, 100) then Draws a magenta rectangle at (238, 34) with width 15 and height 69.
; PLAN: r0=205(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=308(x1), r6=141(y1), r7=99(x2), r8=100(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=34(y), r12=15(width), r13=69(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 141
LDI r7, 99
LDI r8, 100
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 34
LDI r12, 15
LDI r13, 69
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
