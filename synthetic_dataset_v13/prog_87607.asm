; DESCRIPTION: Composite: Renders a orange disk with center (132, 191) and radius 33 then Places a cyan line segment connecting (300, 81) to (175, 22).
; PLAN: r0=132(x), r1=191(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=81(y1), r7=175(x2), r8=22(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 191
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 81
LDI r7, 175
LDI r8, 22
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
