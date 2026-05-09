; DESCRIPTION: Composite: Renders a green line between points (279, 173) and (261, 114) then Places a blue dot at position (96, 18) then Draws a yellow rectangle at (218, 195) with width 105 and height 51.
; PLAN: r0=279(x1), r1=173(y1), r2=261(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=18(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=195(y), r12=105(width), r13=51(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 173
LDI r2, 261
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 18
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 218
LDI r11, 195
LDI r12, 105
LDI r13, 51
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
