; DESCRIPTION: Composite: Renders a red box of size 86x95 starting at (206, 12) then Renders a blue line between points (432, 77) and (271, 68).
; PLAN: r0=206(x), r1=12(y), r2=86(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=77(y1), r7=271(x2), r8=68(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 12
LDI r2, 86
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 77
LDI r7, 271
LDI r8, 68
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
