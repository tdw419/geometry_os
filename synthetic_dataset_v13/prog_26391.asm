; DESCRIPTION: Composite: Draws a black line from (134, 1) to (138, 145) then Renders a blue box of size 24x21 starting at (462, 99).
; PLAN: r0=134(x1), r1=1(y1), r2=138(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=99(y), r7=24(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 1
LDI r2, 138
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 99
LDI r7, 24
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
