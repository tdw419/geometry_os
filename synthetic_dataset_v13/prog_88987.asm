; DESCRIPTION: Composite: Places a green 26x12 rectangle at position (311, 193) then Places a orange dot at position (63, 138) then Draws a cyan line from (322, 134) to (1, 212).
; PLAN: r0=311(x), r1=193(y), r2=26(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=138(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=322(x1), r11=134(y1), r12=1(x2), r13=212(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 193
LDI r2, 26
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 138
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 322
LDI r11, 134
LDI r12, 1
LDI r13, 212
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
