; DESCRIPTION: Composite: Places a green circle of radius 23 at center (379, 219) then Places a blue line segment connecting (18, 47) to (481, 13) then Renders a orange box of size 87x58 starting at (275, 67).
; PLAN: r0=379(x), r1=219(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=47(y1), r7=481(x2), r8=13(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=67(y), r12=87(width), r13=58(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 219
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 47
LDI r7, 481
LDI r8, 13
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 67
LDI r12, 87
LDI r13, 58
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
