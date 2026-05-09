; DESCRIPTION: Composite: Places a orange 40x52 rectangle at position (205, 159) then Places a red dot at position (242, 4) then Places a yellow line segment connecting (181, 68) to (212, 185).
; PLAN: r0=205(x), r1=159(y), r2=40(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=4(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=68(y1), r12=212(x2), r13=185(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 159
LDI r2, 40
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 4
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 181
LDI r11, 68
LDI r12, 212
LDI r13, 185
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
