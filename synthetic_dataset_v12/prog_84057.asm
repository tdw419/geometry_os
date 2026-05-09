; DESCRIPTION: Composite: Draws a cyan line from (178, 214) to (269, 76) then Places a black dot at position (2, 227).
; PLAN: r0=178(x1), r1=214(y1), r2=269(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=227(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 214
LDI r2, 269
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 227
LDI r7, 0x000000
PSET r5, r6, r7
HALT
