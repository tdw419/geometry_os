; DESCRIPTION: Composite: Places a yellow circle of radius 23 at center (231, 103) then Places a magenta line segment connecting (284, 131) to (1, 220) then Renders a black box of size 109x69 starting at (212, 108).
; PLAN: r0=231(x), r1=103(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=131(y1), r7=1(x2), r8=220(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=108(y), r12=109(width), r13=69(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 103
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 131
LDI r7, 1
LDI r8, 220
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 108
LDI r12, 109
LDI r13, 69
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
