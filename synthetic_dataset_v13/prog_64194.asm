; DESCRIPTION: Composite: Renders a orange line between points (188, 235) and (37, 124) then Places a cyan circle of radius 45 at center (186, 74).
; PLAN: r0=188(x1), r1=235(y1), r2=37(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=74(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 235
LDI r2, 37
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 74
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
