; DESCRIPTION: Composite: Draws a purple rectangle at (301, 79) with width 51 and height 111 then Draws a white line from (27, 52) to (295, 181).
; PLAN: r0=301(x), r1=79(y), r2=51(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=52(y1), r7=295(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 79
LDI r2, 51
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 52
LDI r7, 295
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
