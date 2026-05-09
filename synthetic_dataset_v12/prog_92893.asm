; DESCRIPTION: Composite: Draws a yellow line from (409, 230) to (399, 161) then Places a white dot at position (260, 47).
; PLAN: r0=409(x1), r1=230(y1), r2=399(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=47(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 230
LDI r2, 399
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 47
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
