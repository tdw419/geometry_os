; DESCRIPTION: Composite: Draws a blue line from (205, 216) to (34, 180) then Places a purple dot at position (320, 149).
; PLAN: r0=205(x1), r1=216(y1), r2=34(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=149(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 216
LDI r2, 34
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 149
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
