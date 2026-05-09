; DESCRIPTION: Composite: Places a green line segment connecting (148, 72) to (362, 102) then Places a blue dot at position (11, 101) then Places a yellow 72x117 rectangle at position (383, 42).
; PLAN: r0=148(x1), r1=72(y1), r2=362(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=101(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=42(y), r12=72(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 72
LDI r2, 362
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 101
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 42
LDI r12, 72
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
