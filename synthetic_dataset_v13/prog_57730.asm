; DESCRIPTION: Composite: Places a white line segment connecting (377, 196) to (262, 17) then Places a green circle of radius 61 at center (137, 161).
; PLAN: r0=377(x1), r1=196(y1), r2=262(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=161(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 196
LDI r2, 262
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 161
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
