; DESCRIPTION: Composite: Renders a orange disk with center (201, 79) and radius 68 then Places a orange line segment connecting (406, 64) to (151, 195).
; PLAN: r0=201(x), r1=79(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=64(y1), r7=151(x2), r8=195(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 79
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 64
LDI r7, 151
LDI r8, 195
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
