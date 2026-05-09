; DESCRIPTION: Composite: Draws a white line from (58, 116) to (283, 201) then Places a cyan dot at position (362, 89).
; PLAN: r0=58(x1), r1=116(y1), r2=283(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=89(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 116
LDI r2, 283
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 89
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
