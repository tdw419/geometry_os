; DESCRIPTION: Composite: Renders a white line between points (134, 61) and (350, 76) then Renders a orange disk with center (70, 207) and radius 25.
; PLAN: r0=134(x1), r1=61(y1), r2=350(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=207(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 61
LDI r2, 350
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 207
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
