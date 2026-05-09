; DESCRIPTION: Composite: Places a purple dot at position (131, 57) then Creates a green circular shape at (332, 173) with radius 59 then Draws a blue line from (333, 253) to (91, 127).
; PLAN: r0=131(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=173(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x1), r11=253(y1), r12=91(x2), r13=127(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 57
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 173
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 253
LDI r12, 91
LDI r13, 127
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
