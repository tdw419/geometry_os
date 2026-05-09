; DESCRIPTION: Composite: Sets a single cyan pixel at (342, 82) then Draws a yellow circle centered at (128, 125) with radius 59.
; PLAN: r0=342(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=125(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 125
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
