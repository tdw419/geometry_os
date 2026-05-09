; DESCRIPTION: Composite: Draws a orange line from (456, 14) to (220, 194) then Places a blue dot at position (175, 49).
; PLAN: r0=456(x1), r1=14(y1), r2=220(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=49(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 14
LDI r2, 220
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 49
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
