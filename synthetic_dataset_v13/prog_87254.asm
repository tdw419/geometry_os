; DESCRIPTION: Composite: Draws a white rectangle at (227, 111) with width 96 and height 100 then Places a blue line segment connecting (120, 190) to (185, 124).
; PLAN: r0=227(x), r1=111(y), r2=96(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=190(y1), r7=185(x2), r8=124(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 111
LDI r2, 96
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 190
LDI r7, 185
LDI r8, 124
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
