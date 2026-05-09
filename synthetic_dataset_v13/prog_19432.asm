; DESCRIPTION: Composite: Renders a orange line between points (488, 188) and (445, 11) then Places a magenta dot at position (3, 194).
; PLAN: r0=488(x1), r1=188(y1), r2=445(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=194(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 488
LDI r1, 188
LDI r2, 445
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 194
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
