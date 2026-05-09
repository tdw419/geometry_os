; DESCRIPTION: Composite: Places a magenta 10x15 rectangle at position (337, 19) then Places a black dot at position (481, 153) then Renders a red line between points (232, 40) and (281, 93).
; PLAN: r0=337(x), r1=19(y), r2=10(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=153(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=232(x1), r11=40(y1), r12=281(x2), r13=93(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 19
LDI r2, 10
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 153
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 232
LDI r11, 40
LDI r12, 281
LDI r13, 93
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
