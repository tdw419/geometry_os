; DESCRIPTION: Composite: Places a cyan dot at position (218, 138) then Draws a yellow circle centered at (111, 101) with radius 17.
; PLAN: r0=218(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=101(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 101
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
