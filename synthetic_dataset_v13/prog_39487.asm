; DESCRIPTION: Composite: Renders a blue line between points (322, 32) and (460, 127) then Places a black dot at position (253, 167).
; PLAN: r0=322(x1), r1=32(y1), r2=460(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=167(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 32
LDI r2, 460
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 167
LDI r7, 0x000000
PSET r5, r6, r7
HALT
