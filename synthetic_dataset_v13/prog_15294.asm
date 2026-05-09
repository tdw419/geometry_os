; DESCRIPTION: Composite: Draws a blue line from (113, 81) to (96, 163) then Places a green dot at position (93, 47) then Places a purple 93x64 rectangle at position (313, 180).
; PLAN: r0=113(x1), r1=81(y1), r2=96(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=47(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=313(x), r11=180(y), r12=93(width), r13=64(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 81
LDI r2, 96
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 47
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 313
LDI r11, 180
LDI r12, 93
LDI r13, 64
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
