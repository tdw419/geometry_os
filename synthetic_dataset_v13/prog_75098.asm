; DESCRIPTION: Composite: Places a black 66x81 rectangle at position (208, 155) then Renders a red disk with center (210, 68) and radius 42 then Draws a magenta line from (264, 72) to (430, 233).
; PLAN: r0=208(x), r1=155(y), r2=66(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=68(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x1), r11=72(y1), r12=430(x2), r13=233(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 155
LDI r2, 66
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 68
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 72
LDI r12, 430
LDI r13, 233
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
