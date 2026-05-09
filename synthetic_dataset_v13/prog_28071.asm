; DESCRIPTION: Composite: Renders a orange line between points (196, 23) and (374, 94) then Places a black dot at position (330, 36).
; PLAN: r0=196(x1), r1=23(y1), r2=374(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=36(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 196
LDI r1, 23
LDI r2, 374
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 36
LDI r7, 0x000000
PSET r5, r6, r7
HALT
