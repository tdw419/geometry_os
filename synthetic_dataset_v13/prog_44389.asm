; DESCRIPTION: Composite: Renders a black line between points (91, 1) and (15, 44) then Places a magenta dot at position (243, 150) then Renders a yellow box of size 118x66 starting at (126, 56).
; PLAN: r0=91(x1), r1=1(y1), r2=15(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=150(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=56(y), r12=118(width), r13=66(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 1
LDI r2, 15
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 150
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 56
LDI r12, 118
LDI r13, 66
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
