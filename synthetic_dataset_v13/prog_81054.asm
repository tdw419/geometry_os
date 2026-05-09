; DESCRIPTION: Composite: Draws a black line from (205, 133) to (501, 238) then Places a cyan dot at position (340, 3).
; PLAN: r0=205(x1), r1=133(y1), r2=501(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=3(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 133
LDI r2, 501
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 3
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
