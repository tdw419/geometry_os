; DESCRIPTION: Composite: Renders a magenta line between points (33, 133) and (276, 219) then Renders a red box of size 60x84 starting at (94, 60).
; PLAN: r0=33(x1), r1=133(y1), r2=276(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=60(y), r7=60(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 133
LDI r2, 276
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 60
LDI r7, 60
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
