; DESCRIPTION: Composite: Renders a red disk with center (125, 194) and radius 56 then Draws a white line from (282, 113) to (77, 8).
; PLAN: r0=125(x), r1=194(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x1), r6=113(y1), r7=77(x2), r8=8(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 194
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 113
LDI r7, 77
LDI r8, 8
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
