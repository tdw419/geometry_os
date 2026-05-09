; DESCRIPTION: Composite: Renders a white line between points (379, 119) and (174, 111) then Renders a magenta disk with center (384, 192) and radius 44.
; PLAN: r0=379(x1), r1=119(y1), r2=174(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=192(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 119
LDI r2, 174
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 192
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
