; DESCRIPTION: Composite: Places a cyan line segment connecting (97, 204) to (191, 38) then Renders a black disk with center (267, 131) and radius 70.
; PLAN: r0=97(x1), r1=204(y1), r2=191(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=131(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 204
LDI r2, 191
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 131
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
