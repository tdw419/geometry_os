; DESCRIPTION: Composite: Places a green line segment connecting (258, 45) to (61, 255) then Renders a white disk with center (206, 58) and radius 31.
; PLAN: r0=258(x1), r1=45(y1), r2=61(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=58(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 45
LDI r2, 61
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 58
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
