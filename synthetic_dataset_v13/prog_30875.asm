; DESCRIPTION: Composite: Draws a blue line from (74, 67) to (462, 169) then Creates a blue rectangular region at (398, 115) spanning 90 by 20 pixels.
; PLAN: r0=74(x1), r1=67(y1), r2=462(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=115(y), r7=90(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 67
LDI r2, 462
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 115
LDI r7, 90
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
