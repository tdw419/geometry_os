; DESCRIPTION: Composite: Places a blue 56x33 rectangle at position (96, 127) then Places a black dot at position (377, 122) then Renders a yellow line between points (218, 131) and (445, 133).
; PLAN: r0=96(x), r1=127(y), r2=56(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=122(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=218(x1), r11=131(y1), r12=445(x2), r13=133(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 127
LDI r2, 56
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 122
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 218
LDI r11, 131
LDI r12, 445
LDI r13, 133
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
