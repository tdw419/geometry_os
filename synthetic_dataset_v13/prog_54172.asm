; DESCRIPTION: Composite: Renders a yellow line between points (79, 153) and (74, 75) then Places a orange circle of radius 67 at center (443, 186).
; PLAN: r0=79(x1), r1=153(y1), r2=74(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=186(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 153
LDI r2, 74
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 186
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
