; DESCRIPTION: Composite: Places a purple dot at position (480, 176) then Places a black line segment connecting (61, 234) to (96, 159).
; PLAN: r0=480(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=234(y1), r7=96(x2), r8=159(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 176
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 61
LDI r6, 234
LDI r7, 96
LDI r8, 159
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
