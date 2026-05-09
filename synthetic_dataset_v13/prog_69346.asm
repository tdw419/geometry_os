; DESCRIPTION: Composite: Places a orange circle of radius 73 at center (372, 104) then Renders a white line between points (5, 222) and (16, 63).
; PLAN: r0=372(x), r1=104(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x1), r6=222(y1), r7=16(x2), r8=63(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 104
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 222
LDI r7, 16
LDI r8, 63
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
