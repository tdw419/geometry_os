; DESCRIPTION: Composite: Renders a black line between points (91, 67) and (366, 97) then Places a blue dot at position (271, 105).
; PLAN: r0=91(x1), r1=67(y1), r2=366(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=105(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 67
LDI r2, 366
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 105
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
