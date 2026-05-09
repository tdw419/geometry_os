; DESCRIPTION: Composite: Places a blue dot at position (499, 220) then Places a orange line segment connecting (96, 25) to (268, 17).
; PLAN: r0=499(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=25(y1), r7=268(x2), r8=17(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 25
LDI r7, 268
LDI r8, 17
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
