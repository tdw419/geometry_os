; DESCRIPTION: Composite: Draws a blue circle centered at (25, 102) with radius 15 then Renders a cyan box of size 68x67 starting at (259, 126).
; PLAN: r0=25(x), r1=102(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=126(y), r7=68(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 102
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 126
LDI r7, 68
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
