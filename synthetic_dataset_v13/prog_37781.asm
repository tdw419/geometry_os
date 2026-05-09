; DESCRIPTION: Composite: Renders a orange line between points (79, 33) and (410, 253) then Places a black dot at position (95, 194).
; PLAN: r0=79(x1), r1=33(y1), r2=410(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 33
LDI r2, 410
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
HALT
