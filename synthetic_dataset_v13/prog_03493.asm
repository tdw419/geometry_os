; DESCRIPTION: Composite: Draws a yellow line from (441, 136) to (103, 186) then Places a red dot at position (111, 196) then Creates a red rectangular region at (141, 21) spanning 114 by 33 pixels.
; PLAN: r0=441(x1), r1=136(y1), r2=103(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=196(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=21(y), r12=114(width), r13=33(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 136
LDI r2, 103
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 196
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 141
LDI r11, 21
LDI r12, 114
LDI r13, 33
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
