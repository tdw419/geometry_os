; DESCRIPTION: Composite: Draws a magenta rectangle at (260, 179) with width 76 and height 20 then Places a yellow dot at position (85, 174) then Renders a orange line between points (393, 73) and (115, 228).
; PLAN: r0=260(x), r1=179(y), r2=76(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=174(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=393(x1), r11=73(y1), r12=115(x2), r13=228(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 179
LDI r2, 76
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 174
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 393
LDI r11, 73
LDI r12, 115
LDI r13, 228
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
