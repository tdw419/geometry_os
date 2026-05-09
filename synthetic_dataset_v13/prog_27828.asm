; DESCRIPTION: Composite: Places a yellow line segment connecting (426, 14) to (485, 213) then Renders a orange box of size 95x100 starting at (9, 74).
; PLAN: r0=426(x1), r1=14(y1), r2=485(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=74(y), r7=95(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 14
LDI r2, 485
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 74
LDI r7, 95
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
