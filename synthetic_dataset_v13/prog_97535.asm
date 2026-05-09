; DESCRIPTION: Composite: Draws a yellow rectangle at (403, 197) with width 108 and height 15 then Draws a black line from (227, 113) to (56, 7).
; PLAN: r0=403(x), r1=197(y), r2=108(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=113(y1), r7=56(x2), r8=7(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 197
LDI r2, 108
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 113
LDI r7, 56
LDI r8, 7
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
