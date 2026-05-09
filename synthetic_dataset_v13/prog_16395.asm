; DESCRIPTION: Composite: Places a green line segment connecting (382, 183) to (326, 124) then Renders a green disk with center (112, 73) and radius 56.
; PLAN: r0=382(x1), r1=183(y1), r2=326(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=73(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 382
LDI r1, 183
LDI r2, 326
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 73
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
