; DESCRIPTION: Composite: Draws a white line from (352, 125) to (309, 232) then Renders a white disk with center (170, 111) and radius 76.
; PLAN: r0=352(x1), r1=125(y1), r2=309(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=111(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 125
LDI r2, 309
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 111
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
