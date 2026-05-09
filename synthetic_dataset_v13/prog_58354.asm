; DESCRIPTION: Composite: Draws a white line from (243, 248) to (54, 10) then Draws a white rectangle at (232, 66) with width 22 and height 44.
; PLAN: r0=243(x1), r1=248(y1), r2=54(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=66(y), r7=22(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 248
LDI r2, 54
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 66
LDI r7, 22
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
