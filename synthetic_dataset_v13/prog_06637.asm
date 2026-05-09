; DESCRIPTION: Composite: Places a orange 66x92 rectangle at position (122, 128) then Places a yellow line segment connecting (21, 68) to (355, 230) then Places a magenta circle of radius 13 at center (465, 174).
; PLAN: r0=122(x), r1=128(y), r2=66(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=68(y1), r7=355(x2), r8=230(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=174(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 128
LDI r2, 66
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 68
LDI r7, 355
LDI r8, 230
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 174
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
