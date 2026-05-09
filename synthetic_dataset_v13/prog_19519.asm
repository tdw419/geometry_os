; DESCRIPTION: Composite: Places a orange line segment connecting (372, 168) to (45, 215) then Places a orange circle of radius 54 at center (250, 104).
; PLAN: r0=372(x1), r1=168(y1), r2=45(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=104(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 168
LDI r2, 45
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 104
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
