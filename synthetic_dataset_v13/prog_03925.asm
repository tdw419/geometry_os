; DESCRIPTION: Composite: Places a blue dot at position (9, 197) then Draws a black line from (160, 74) to (80, 43) then Renders a black disk with center (131, 111) and radius 39.
; PLAN: r0=9(x), r1=197(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=74(y1), r7=80(x2), r8=43(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=111(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 197
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 74
LDI r7, 80
LDI r8, 43
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 111
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
