; DESCRIPTION: Composite: Renders a red line between points (262, 117) and (47, 116) then Places a blue circle of radius 38 at center (465, 129).
; PLAN: r0=262(x1), r1=117(y1), r2=47(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=129(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 117
LDI r2, 47
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 129
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
