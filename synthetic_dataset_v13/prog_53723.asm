; DESCRIPTION: Composite: Places a white dot at position (26, 50) then Draws a yellow circle centered at (277, 144) with radius 74.
; PLAN: r0=26(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=144(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 144
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
