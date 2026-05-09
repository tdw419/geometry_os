; DESCRIPTION: Composite: Renders a magenta line between points (125, 41) and (158, 171) then Renders a purple disk with center (94, 215) and radius 41.
; PLAN: r0=125(x1), r1=41(y1), r2=158(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=215(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 41
LDI r2, 158
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 215
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
