; DESCRIPTION: Composite: Draws a green line from (507, 227) to (10, 109) then Renders a purple disk with center (249, 152) and radius 67.
; PLAN: r0=507(x1), r1=227(y1), r2=10(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=152(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 227
LDI r2, 10
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 152
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
