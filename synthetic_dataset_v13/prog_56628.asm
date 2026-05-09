; DESCRIPTION: Composite: Draws a black rectangle at (262, 162) with width 81 and height 27 then Draws a magenta line from (55, 227) to (141, 224) then Places a orange dot at position (100, 127).
; PLAN: r0=262(x), r1=162(y), r2=81(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x1), r6=227(y1), r7=141(x2), r8=224(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=127(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 162
LDI r2, 81
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 227
LDI r7, 141
LDI r8, 224
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 127
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
