; DESCRIPTION: Composite: Renders a orange line between points (481, 133) and (196, 148) then Places a green circle of radius 19 at center (441, 36).
; PLAN: r0=481(x1), r1=133(y1), r2=196(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=36(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 133
LDI r2, 196
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 36
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
