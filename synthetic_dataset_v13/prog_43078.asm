; DESCRIPTION: Composite: Draws a purple line from (93, 111) to (266, 198) then Renders a red box of size 21x41 starting at (5, 50).
; PLAN: r0=93(x1), r1=111(y1), r2=266(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=50(y), r7=21(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 111
LDI r2, 266
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 50
LDI r7, 21
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
