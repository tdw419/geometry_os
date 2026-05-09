; DESCRIPTION: Composite: Places a yellow line segment connecting (6, 225) to (70, 140) then Renders a yellow disk with center (352, 73) and radius 64.
; PLAN: r0=6(x1), r1=225(y1), r2=70(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=73(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 225
LDI r2, 70
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 73
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
