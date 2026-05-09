; DESCRIPTION: Composite: Places a white circle of radius 25 at center (455, 219) then Renders a purple box of size 66x67 starting at (420, 168) then Renders a purple line between points (66, 169) and (371, 55).
; PLAN: r0=455(x), r1=219(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=168(y), r7=66(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x1), r11=169(y1), r12=371(x2), r13=55(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 219
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 168
LDI r7, 66
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 169
LDI r12, 371
LDI r13, 55
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
