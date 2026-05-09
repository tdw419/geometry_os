; DESCRIPTION: Composite: Draws a blue line from (310, 112) to (251, 124) then Places a cyan dot at position (69, 23).
; PLAN: r0=310(x1), r1=112(y1), r2=251(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 112
LDI r2, 251
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
