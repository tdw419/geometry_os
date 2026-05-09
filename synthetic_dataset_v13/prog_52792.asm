; DESCRIPTION: Composite: Draws a blue circle centered at (291, 95) with radius 59 then Renders a white box of size 22x118 starting at (406, 126).
; PLAN: r0=291(x), r1=95(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=126(y), r7=22(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 95
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 126
LDI r7, 22
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
