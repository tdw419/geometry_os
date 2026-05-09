; DESCRIPTION: Composite: Places a yellow line segment connecting (96, 117) to (50, 90) then Places a blue dot at position (69, 51).
; PLAN: r0=96(x1), r1=117(y1), r2=50(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=51(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 117
LDI r2, 50
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 51
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
