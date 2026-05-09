; DESCRIPTION: Composite: Renders a black line between points (260, 24) and (222, 140) then Places a cyan circle of radius 67 at center (88, 87).
; PLAN: r0=260(x1), r1=24(y1), r2=222(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=87(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 24
LDI r2, 222
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 87
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
