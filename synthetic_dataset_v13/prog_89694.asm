; DESCRIPTION: Composite: Draws a yellow line from (46, 54) to (199, 52) then Places a cyan dot at position (122, 9).
; PLAN: r0=46(x1), r1=54(y1), r2=199(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 54
LDI r2, 199
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
