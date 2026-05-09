; DESCRIPTION: Composite: Renders a black line between points (3, 2) and (90, 95) then Places a white dot at position (269, 198).
; PLAN: r0=3(x1), r1=2(y1), r2=90(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=198(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 3
LDI r1, 2
LDI r2, 90
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 198
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
