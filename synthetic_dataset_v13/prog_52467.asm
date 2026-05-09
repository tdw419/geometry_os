; DESCRIPTION: Composite: Draws a yellow line from (221, 30) to (260, 179) then Places a red dot at position (329, 88) then Renders a purple box of size 99x25 starting at (237, 169).
; PLAN: r0=221(x1), r1=30(y1), r2=260(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=88(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=237(x), r11=169(y), r12=99(width), r13=25(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 30
LDI r2, 260
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 88
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 237
LDI r11, 169
LDI r12, 99
LDI r13, 25
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
