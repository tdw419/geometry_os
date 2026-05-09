; DESCRIPTION: Composite: Creates a yellow rectangular region at (137, 131) spanning 72 by 69 pixels then Places a magenta dot at position (107, 25) then Renders a cyan line between points (112, 184) and (388, 181).
; PLAN: r0=137(x), r1=131(y), r2=72(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=25(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=112(x1), r11=184(y1), r12=388(x2), r13=181(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 131
LDI r2, 72
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 25
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 112
LDI r11, 184
LDI r12, 388
LDI r13, 181
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
