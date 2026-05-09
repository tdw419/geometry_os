; DESCRIPTION: Composite: Renders a magenta box of size 106x45 starting at (24, 80) then Places a purple dot at position (180, 20) then Renders a black line between points (371, 133) and (121, 209).
; PLAN: r0=24(x), r1=80(y), r2=106(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=20(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=371(x1), r11=133(y1), r12=121(x2), r13=209(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 80
LDI r2, 106
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 20
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 371
LDI r11, 133
LDI r12, 121
LDI r13, 209
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
