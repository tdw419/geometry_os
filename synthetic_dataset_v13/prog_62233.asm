; DESCRIPTION: Composite: Draws a blue line from (69, 40) to (469, 223) then Places a white circle of radius 33 at center (369, 135).
; PLAN: r0=69(x1), r1=40(y1), r2=469(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=135(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 40
LDI r2, 469
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 135
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
