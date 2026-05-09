; DESCRIPTION: Composite: Draws a blue line from (135, 3) to (11, 165) then Places a purple circle of radius 33 at center (169, 213).
; PLAN: r0=135(x1), r1=3(y1), r2=11(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=213(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 3
LDI r2, 11
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 213
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
