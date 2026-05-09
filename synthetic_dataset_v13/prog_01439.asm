; DESCRIPTION: Composite: Renders a purple line between points (395, 28) and (436, 78) then Renders a red box of size 91x54 starting at (251, 39).
; PLAN: r0=395(x1), r1=28(y1), r2=436(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=39(y), r7=91(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 28
LDI r2, 436
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 39
LDI r7, 91
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
