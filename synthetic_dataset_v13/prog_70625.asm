; DESCRIPTION: Composite: Places a blue dot at position (36, 29) then Renders a black box of size 66x91 starting at (169, 146) then Draws a blue line from (62, 13) to (64, 188).
; PLAN: r0=36(x), r1=29(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=146(y), r7=66(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x1), r11=13(y1), r12=64(x2), r13=188(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 29
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 146
LDI r7, 66
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 13
LDI r12, 64
LDI r13, 188
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
