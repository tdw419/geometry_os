; DESCRIPTION: Composite: Renders a black line between points (492, 19) and (371, 100) then Creates a magenta rectangular region at (43, 109) spanning 115 by 58 pixels then Places a black dot at position (74, 228).
; PLAN: r0=492(x1), r1=19(y1), r2=371(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=109(y), r7=115(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x), r11=228(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 492
LDI r1, 19
LDI r2, 371
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 109
LDI r7, 115
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 228
LDI r12, 0x000000
PSET r10, r11, r12
HALT
