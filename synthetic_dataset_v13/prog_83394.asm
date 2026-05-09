; DESCRIPTION: Composite: Places a orange line segment connecting (285, 129) to (327, 253) then Places a cyan dot at position (77, 127).
; PLAN: r0=285(x1), r1=129(y1), r2=327(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=127(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 129
LDI r2, 327
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 127
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
