; DESCRIPTION: Composite: Renders a blue box of size 40x111 starting at (71, 105) then Draws a black line from (175, 163) to (19, 239).
; PLAN: r0=71(x), r1=105(y), r2=40(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=163(y1), r7=19(x2), r8=239(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 105
LDI r2, 40
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 163
LDI r7, 19
LDI r8, 239
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
