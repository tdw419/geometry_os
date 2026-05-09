; DESCRIPTION: Composite: Renders a white disk with center (455, 94) and radius 24 then Places a yellow line segment connecting (458, 33) to (168, 114).
; PLAN: r0=455(x), r1=94(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x1), r6=33(y1), r7=168(x2), r8=114(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 94
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 33
LDI r7, 168
LDI r8, 114
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
