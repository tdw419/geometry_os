; DESCRIPTION: Composite: Draws a purple line from (242, 24) to (69, 120) then Draws a magenta rectangle at (182, 123) with width 22 and height 119.
; PLAN: r0=242(x1), r1=24(y1), r2=69(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=123(y), r7=22(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 24
LDI r2, 69
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 123
LDI r7, 22
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
