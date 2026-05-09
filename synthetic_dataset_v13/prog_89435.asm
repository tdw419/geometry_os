; DESCRIPTION: Composite: Renders a magenta line between points (167, 224) and (80, 27) then Places a orange dot at position (342, 5) then Places a black 25x70 rectangle at position (114, 155).
; PLAN: r0=167(x1), r1=224(y1), r2=80(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=155(y), r12=25(width), r13=70(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 224
LDI r2, 80
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 114
LDI r11, 155
LDI r12, 25
LDI r13, 70
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
