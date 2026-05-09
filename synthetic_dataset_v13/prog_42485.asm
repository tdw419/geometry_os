; DESCRIPTION: Composite: Renders a blue line between points (261, 109) and (48, 223) then Renders a orange box of size 112x37 starting at (265, 78).
; PLAN: r0=261(x1), r1=109(y1), r2=48(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=78(y), r7=112(width), r8=37(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 109
LDI r2, 48
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 78
LDI r7, 112
LDI r8, 37
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
