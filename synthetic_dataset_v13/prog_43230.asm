; DESCRIPTION: Composite: Draws a black rectangle at (387, 230) with width 113 and height 12 then Draws a black line from (341, 37) to (109, 6).
; PLAN: r0=387(x), r1=230(y), r2=113(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=37(y1), r7=109(x2), r8=6(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 230
LDI r2, 113
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 37
LDI r7, 109
LDI r8, 6
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
