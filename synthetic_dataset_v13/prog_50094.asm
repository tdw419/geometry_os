; DESCRIPTION: Composite: Places a green dot at position (355, 14) then Draws a orange circle centered at (251, 152) with radius 54.
; PLAN: r0=355(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=152(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 251
LDI r6, 152
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
