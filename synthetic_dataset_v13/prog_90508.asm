; DESCRIPTION: Composite: Renders a orange line between points (296, 8) and (224, 69) then Renders a blue box of size 73x75 starting at (113, 153).
; PLAN: r0=296(x1), r1=8(y1), r2=224(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=153(y), r7=73(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 8
LDI r2, 224
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 153
LDI r7, 73
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
