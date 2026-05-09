; DESCRIPTION: Composite: Sets a single blue pixel at (409, 44) then Renders a white line between points (506, 204) and (426, 141).
; PLAN: r0=409(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=506(x1), r6=204(y1), r7=426(x2), r8=141(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 506
LDI r6, 204
LDI r7, 426
LDI r8, 141
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
