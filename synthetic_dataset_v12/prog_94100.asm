; DESCRIPTION: Composite: Renders a white disk with center (406, 61) and radius 43 then Places a green line segment connecting (503, 107) to (22, 173).
; PLAN: r0=406(x), r1=61(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x1), r6=107(y1), r7=22(x2), r8=173(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 61
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 107
LDI r7, 22
LDI r8, 173
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
