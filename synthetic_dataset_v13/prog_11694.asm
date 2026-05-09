; DESCRIPTION: Composite: Creates a orange circular shape at (387, 59) with radius 52 then Places a red line segment connecting (256, 68) to (377, 139) then Renders a green box of size 67x99 starting at (161, 29).
; PLAN: r0=387(x), r1=59(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x1), r6=68(y1), r7=377(x2), r8=139(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=29(y), r12=67(width), r13=99(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 59
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 68
LDI r7, 377
LDI r8, 139
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 29
LDI r12, 67
LDI r13, 99
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
