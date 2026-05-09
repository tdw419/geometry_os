; DESCRIPTION: Composite: Renders a purple box of size 101x28 starting at (233, 153) then Places a magenta line segment connecting (7, 78) to (482, 123).
; PLAN: r0=233(x), r1=153(y), r2=101(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=78(y1), r7=482(x2), r8=123(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 153
LDI r2, 101
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 78
LDI r7, 482
LDI r8, 123
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
