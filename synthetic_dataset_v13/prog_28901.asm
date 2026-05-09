; DESCRIPTION: Composite: Places a orange line segment connecting (411, 112) to (455, 93) then Places a blue dot at position (32, 150).
; PLAN: r0=411(x1), r1=112(y1), r2=455(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=150(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 112
LDI r2, 455
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 150
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
