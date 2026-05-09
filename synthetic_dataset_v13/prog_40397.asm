; DESCRIPTION: Composite: Renders a cyan line between points (383, 28) and (282, 181) then Places a yellow dot at position (387, 88) then Creates a magenta rectangular region at (330, 136) spanning 107 by 82 pixels.
; PLAN: r0=383(x1), r1=28(y1), r2=282(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=88(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=136(y), r12=107(width), r13=82(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 28
LDI r2, 282
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 88
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 330
LDI r11, 136
LDI r12, 107
LDI r13, 82
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
