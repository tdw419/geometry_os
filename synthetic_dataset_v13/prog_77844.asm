; DESCRIPTION: Composite: Renders a red box of size 118x59 starting at (325, 175) then Renders a yellow line between points (213, 30) and (462, 27).
; PLAN: r0=325(x), r1=175(y), r2=118(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=30(y1), r7=462(x2), r8=27(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 175
LDI r2, 118
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 30
LDI r7, 462
LDI r8, 27
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
