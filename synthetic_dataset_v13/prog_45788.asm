; DESCRIPTION: Composite: Draws a black rectangle at (333, 59) with width 75 and height 56 then Renders a green line between points (43, 76) and (403, 88).
; PLAN: r0=333(x), r1=59(y), r2=75(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x1), r6=76(y1), r7=403(x2), r8=88(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 59
LDI r2, 75
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 76
LDI r7, 403
LDI r8, 88
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
