; DESCRIPTION: Composite: Draws a green line from (388, 253) to (300, 193) then Places a orange dot at position (33, 32).
; PLAN: r0=388(x1), r1=253(y1), r2=300(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=32(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 253
LDI r2, 300
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 32
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
