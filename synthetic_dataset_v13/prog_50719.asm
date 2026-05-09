; DESCRIPTION: Composite: Places a yellow line segment connecting (313, 28) to (145, 8) then Places a orange dot at position (483, 33) then Renders a blue box of size 67x103 starting at (5, 111).
; PLAN: r0=313(x1), r1=28(y1), r2=145(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=33(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=5(x), r11=111(y), r12=67(width), r13=103(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 28
LDI r2, 145
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 33
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 5
LDI r11, 111
LDI r12, 67
LDI r13, 103
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
