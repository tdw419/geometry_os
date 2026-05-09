; DESCRIPTION: Composite: Draws a blue line from (281, 64) to (410, 253) then Places a black dot at position (216, 112).
; PLAN: r0=281(x1), r1=64(y1), r2=410(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=112(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 64
LDI r2, 410
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 112
LDI r7, 0x000000
PSET r5, r6, r7
HALT
