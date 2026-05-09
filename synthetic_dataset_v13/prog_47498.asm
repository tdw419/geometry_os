; DESCRIPTION: Composite: Renders a red box of size 37x69 starting at (295, 86) then Draws a orange line from (89, 66) to (336, 71).
; PLAN: r0=295(x), r1=86(y), r2=37(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=66(y1), r7=336(x2), r8=71(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 86
LDI r2, 37
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 66
LDI r7, 336
LDI r8, 71
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
