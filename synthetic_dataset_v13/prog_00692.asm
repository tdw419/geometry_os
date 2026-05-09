; DESCRIPTION: Composite: Draws a cyan line from (347, 152) to (389, 37) then Places a white dot at position (13, 183).
; PLAN: r0=347(x1), r1=152(y1), r2=389(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=183(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 152
LDI r2, 389
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 183
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
