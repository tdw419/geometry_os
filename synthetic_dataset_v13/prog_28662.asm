; DESCRIPTION: Composite: Places a cyan dot at position (452, 144) then Draws a yellow circle centered at (394, 192) with radius 64.
; PLAN: r0=452(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=192(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 452
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 192
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
