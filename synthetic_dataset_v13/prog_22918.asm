; DESCRIPTION: Composite: Draws a black line from (65, 124) to (175, 171) then Places a purple dot at position (377, 188).
; PLAN: r0=65(x1), r1=124(y1), r2=175(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=188(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 124
LDI r2, 175
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 188
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
