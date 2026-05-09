; DESCRIPTION: Composite: Places a purple line segment connecting (242, 74) to (101, 15) then Places a orange dot at position (87, 142).
; PLAN: r0=242(x1), r1=74(y1), r2=101(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=142(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 74
LDI r2, 101
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 142
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
