; DESCRIPTION: Composite: Places a green circle of radius 51 at center (236, 140) then Renders a black line between points (443, 111) and (28, 159).
; PLAN: r0=236(x), r1=140(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x1), r6=111(y1), r7=28(x2), r8=159(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 140
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 111
LDI r7, 28
LDI r8, 159
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
