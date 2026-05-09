; DESCRIPTION: Composite: Draws a blue rectangle at (313, 98) with width 56 and height 34 then Draws a black line from (259, 149) to (252, 172).
; PLAN: r0=313(x), r1=98(y), r2=56(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=149(y1), r7=252(x2), r8=172(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 98
LDI r2, 56
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 149
LDI r7, 252
LDI r8, 172
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
