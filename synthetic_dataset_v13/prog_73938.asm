; DESCRIPTION: Composite: Draws a blue line from (454, 217) to (271, 119) then Draws a black rectangle at (73, 54) with width 20 and height 104.
; PLAN: r0=454(x1), r1=217(y1), r2=271(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=54(y), r7=20(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 217
LDI r2, 271
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 54
LDI r7, 20
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
