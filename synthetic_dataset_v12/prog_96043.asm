; DESCRIPTION: Composite: Renders a purple line between points (183, 93) and (317, 238) then Places a orange circle of radius 38 at center (103, 174).
; PLAN: r0=183(x1), r1=93(y1), r2=317(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=174(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 93
LDI r2, 317
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 174
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
