; DESCRIPTION: Composite: Places a blue line segment connecting (204, 206) to (422, 74) then Places a black dot at position (116, 132).
; PLAN: r0=204(x1), r1=206(y1), r2=422(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=132(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 204
LDI r1, 206
LDI r2, 422
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 132
LDI r7, 0x000000
PSET r5, r6, r7
HALT
