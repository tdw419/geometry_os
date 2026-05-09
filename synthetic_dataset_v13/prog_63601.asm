; DESCRIPTION: Composite: Renders a black line between points (394, 230) and (303, 9) then Renders a white disk with center (132, 114) and radius 66.
; PLAN: r0=394(x1), r1=230(y1), r2=303(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=114(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 230
LDI r2, 303
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 114
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
