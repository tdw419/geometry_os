; DESCRIPTION: Composite: Draws a purple line from (99, 142) to (263, 37) then Sets a single magenta pixel at (313, 220) then Places a green 37x111 rectangle at position (107, 92).
; PLAN: r0=99(x1), r1=142(y1), r2=263(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=220(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=92(y), r12=37(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 142
LDI r2, 263
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 220
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 92
LDI r12, 37
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
