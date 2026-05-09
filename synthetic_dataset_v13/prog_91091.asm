; DESCRIPTION: Composite: Places a green line segment connecting (72, 21) to (480, 103) then Renders a purple box of size 97x19 starting at (314, 68).
; PLAN: r0=72(x1), r1=21(y1), r2=480(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=68(y), r7=97(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 21
LDI r2, 480
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 68
LDI r7, 97
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
