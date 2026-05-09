; DESCRIPTION: Composite: Draws a yellow circle centered at (156, 124) with radius 49 then Places a cyan dot at position (404, 88).
; PLAN: r0=156(x), r1=124(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 124
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
