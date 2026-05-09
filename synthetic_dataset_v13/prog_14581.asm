; DESCRIPTION: Composite: Places a red dot at position (354, 164) then Draws a green circle centered at (158, 115) with radius 56 then Draws a blue line from (452, 255) to (111, 219).
; PLAN: r0=354(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=115(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=452(x1), r11=255(y1), r12=111(x2), r13=219(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 158
LDI r6, 115
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 452
LDI r11, 255
LDI r12, 111
LDI r13, 219
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
