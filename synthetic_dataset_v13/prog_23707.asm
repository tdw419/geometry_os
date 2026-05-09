; DESCRIPTION: Composite: Places a cyan dot at position (182, 10) then Draws a yellow circle centered at (367, 143) with radius 75.
; PLAN: r0=182(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=143(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 143
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
