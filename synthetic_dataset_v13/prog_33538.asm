; DESCRIPTION: Composite: Places a yellow line segment connecting (437, 100) to (359, 59) then Renders a blue box of size 56x67 starting at (434, 14).
; PLAN: r0=437(x1), r1=100(y1), r2=359(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=14(y), r7=56(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 100
LDI r2, 359
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 14
LDI r7, 56
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
