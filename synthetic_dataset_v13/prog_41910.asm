; DESCRIPTION: Composite: Draws a blue line from (276, 185) to (406, 5) then Renders a black box of size 43x57 starting at (327, 14).
; PLAN: r0=276(x1), r1=185(y1), r2=406(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=14(y), r7=43(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 185
LDI r2, 406
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 14
LDI r7, 43
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
