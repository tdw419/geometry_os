; DESCRIPTION: Composite: Renders a white disk with center (56, 148) and radius 52 then Places a green line segment connecting (427, 204) to (502, 140).
; PLAN: r0=56(x), r1=148(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=204(y1), r7=502(x2), r8=140(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 148
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 204
LDI r7, 502
LDI r8, 140
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
