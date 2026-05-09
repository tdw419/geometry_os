; DESCRIPTION: Composite: Draws a yellow circle centered at (434, 122) with radius 59 then Renders a green box of size 25x106 starting at (201, 37).
; PLAN: r0=434(x), r1=122(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=37(y), r7=25(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 122
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 37
LDI r7, 25
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
