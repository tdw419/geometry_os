; DESCRIPTION: Composite: Places a red 66x21 rectangle at position (395, 103) then Places a orange dot at position (35, 222) then Draws a magenta line from (29, 166) to (98, 191).
; PLAN: r0=395(x), r1=103(y), r2=66(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=222(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=29(x1), r11=166(y1), r12=98(x2), r13=191(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 103
LDI r2, 66
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 222
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 29
LDI r11, 166
LDI r12, 98
LDI r13, 191
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
