; DESCRIPTION: Composite: Places a magenta circle of radius 52 at center (362, 56) then Places a purple 64x91 rectangle at position (93, 141) then Draws a red line from (383, 102) to (397, 213).
; PLAN: r0=362(x), r1=56(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=141(y), r7=64(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x1), r11=102(y1), r12=397(x2), r13=213(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 56
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 141
LDI r7, 64
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 102
LDI r12, 397
LDI r13, 213
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
