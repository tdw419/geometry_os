; DESCRIPTION: Composite: Draws a purple line from (199, 170) to (446, 197) then Renders a red box of size 28x29 starting at (317, 71).
; PLAN: r0=199(x1), r1=170(y1), r2=446(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=71(y), r7=28(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 170
LDI r2, 446
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 71
LDI r7, 28
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
