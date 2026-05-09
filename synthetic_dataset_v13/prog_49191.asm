; DESCRIPTION: Composite: Draws a black line from (11, 196) to (507, 16) then Places a yellow dot at position (5, 184).
; PLAN: r0=11(x1), r1=196(y1), r2=507(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=184(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 196
LDI r2, 507
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 184
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
