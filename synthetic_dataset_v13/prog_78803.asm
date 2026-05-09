; DESCRIPTION: Composite: Draws a black line from (329, 67) to (411, 69) then Renders a purple disk with center (160, 109) and radius 46.
; PLAN: r0=329(x1), r1=67(y1), r2=411(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=109(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 67
LDI r2, 411
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 109
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
