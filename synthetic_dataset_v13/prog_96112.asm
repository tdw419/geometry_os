; DESCRIPTION: Composite: Renders a red box of size 85x73 starting at (25, 80) then Renders a blue line between points (275, 3) and (94, 108).
; PLAN: r0=25(x), r1=80(y), r2=85(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=3(y1), r7=94(x2), r8=108(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 80
LDI r2, 85
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 3
LDI r7, 94
LDI r8, 108
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
