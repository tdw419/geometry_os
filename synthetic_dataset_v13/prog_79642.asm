; DESCRIPTION: Composite: Draws a purple circle centered at (91, 90) with radius 22 then Renders a purple box of size 40x39 starting at (20, 162).
; PLAN: r0=91(x), r1=90(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=162(y), r7=40(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 90
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 162
LDI r7, 40
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
