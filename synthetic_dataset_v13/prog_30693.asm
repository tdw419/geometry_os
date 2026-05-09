; DESCRIPTION: Composite: Places a black line segment connecting (70, 0) to (480, 87) then Places a white dot at position (241, 133).
; PLAN: r0=70(x1), r1=0(y1), r2=480(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=133(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 0
LDI r2, 480
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 133
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
