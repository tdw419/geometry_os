; DESCRIPTION: Composite: Renders a red line between points (422, 155) and (81, 213) then Places a black dot at position (420, 107).
; PLAN: r0=422(x1), r1=155(y1), r2=81(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=107(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 155
LDI r2, 81
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 107
LDI r7, 0x000000
PSET r5, r6, r7
HALT
