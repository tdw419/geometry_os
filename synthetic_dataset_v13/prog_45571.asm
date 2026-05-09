; DESCRIPTION: Composite: Sets a single orange pixel at (48, 65) then Places a black line segment connecting (255, 105) to (4, 17).
; PLAN: r0=48(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=105(y1), r7=4(x2), r8=17(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 255
LDI r6, 105
LDI r7, 4
LDI r8, 17
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
