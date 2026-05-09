; DESCRIPTION: Composite: Places a green dot at position (315, 47) then Draws a orange circle centered at (18, 50) with radius 10.
; PLAN: r0=315(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=50(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 18
LDI r6, 50
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
