; DESCRIPTION: Composite: Places a green line segment connecting (485, 147) to (101, 47) then Places a cyan circle of radius 40 at center (360, 114).
; PLAN: r0=485(x1), r1=147(y1), r2=101(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=114(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 485
LDI r1, 147
LDI r2, 101
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 114
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
