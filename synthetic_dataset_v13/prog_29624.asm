; DESCRIPTION: Composite: Draws a white line from (443, 18) to (389, 233) then Renders a magenta disk with center (368, 187) and radius 56.
; PLAN: r0=443(x1), r1=18(y1), r2=389(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=187(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 18
LDI r2, 389
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 187
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
