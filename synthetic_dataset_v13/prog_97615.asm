; DESCRIPTION: Composite: Places a magenta dot at position (423, 14) then Draws a green circle centered at (91, 104) with radius 56.
; PLAN: r0=423(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=104(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 423
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 104
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
