; DESCRIPTION: Composite: Renders a red box of size 62x59 starting at (48, 59) then Renders a magenta line between points (213, 241) and (105, 155).
; PLAN: r0=48(x), r1=59(y), r2=62(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=241(y1), r7=105(x2), r8=155(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 59
LDI r2, 62
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 241
LDI r7, 105
LDI r8, 155
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
