; DESCRIPTION: Composite: Renders a black line between points (245, 5) and (330, 17) then Places a black dot at position (0, 247).
; PLAN: r0=245(x1), r1=5(y1), r2=330(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 5
LDI r2, 330
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
HALT
