; DESCRIPTION: Composite: Sets a single yellow pixel at (398, 44) then Renders a blue box of size 56x26 starting at (293, 122) then Draws a yellow line from (114, 252) to (198, 67).
; PLAN: r0=398(x), r1=44(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=122(y), r7=56(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x1), r11=252(y1), r12=198(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 44
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 293
LDI r6, 122
LDI r7, 56
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 252
LDI r12, 198
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
