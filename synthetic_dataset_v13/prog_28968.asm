; DESCRIPTION: Composite: Draws a white line from (112, 89) to (391, 43) then Draws a black rectangle at (243, 148) with width 57 and height 57.
; PLAN: r0=112(x1), r1=89(y1), r2=391(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=148(y), r7=57(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 89
LDI r2, 391
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 148
LDI r7, 57
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
