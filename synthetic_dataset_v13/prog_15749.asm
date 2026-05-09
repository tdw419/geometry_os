; DESCRIPTION: Composite: Places a red line segment connecting (446, 250) to (286, 135) then Places a purple dot at position (20, 6).
; PLAN: r0=446(x1), r1=250(y1), r2=286(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=6(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 446
LDI r1, 250
LDI r2, 286
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 6
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
