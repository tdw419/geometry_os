; DESCRIPTION: Composite: Renders a red box of size 103x69 starting at (281, 137) then Renders a magenta line between points (348, 220) and (428, 205).
; PLAN: r0=281(x), r1=137(y), r2=103(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=220(y1), r7=428(x2), r8=205(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 137
LDI r2, 103
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 220
LDI r7, 428
LDI r8, 205
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
