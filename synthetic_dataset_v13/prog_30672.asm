; DESCRIPTION: Composite: Places a white dot at position (314, 113) then Renders a magenta line between points (1, 165) and (203, 197).
; PLAN: r0=314(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=1(x1), r6=165(y1), r7=203(x2), r8=197(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 1
LDI r6, 165
LDI r7, 203
LDI r8, 197
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
