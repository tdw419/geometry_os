; DESCRIPTION: Composite: Places a cyan dot at position (307, 10) then Draws a orange circle centered at (148, 40) with radius 18.
; PLAN: r0=307(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=40(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 40
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
