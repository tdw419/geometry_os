; DESCRIPTION: Composite: Places a green dot at position (444, 233) then Draws a orange circle centered at (220, 74) with radius 44.
; PLAN: r0=444(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=74(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 233
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 220
LDI r6, 74
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
