; DESCRIPTION: Composite: Renders a black line between points (304, 162) and (26, 44) then Places a orange circle of radius 67 at center (112, 150).
; PLAN: r0=304(x1), r1=162(y1), r2=26(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=150(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 162
LDI r2, 26
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 150
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
