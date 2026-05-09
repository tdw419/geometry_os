; DESCRIPTION: Composite: Draws a red line from (280, 112) to (286, 37) then Draws a red rectangle at (43, 210) with width 84 and height 36.
; PLAN: r0=280(x1), r1=112(y1), r2=286(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=210(y), r7=84(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 112
LDI r2, 286
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 210
LDI r7, 84
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
