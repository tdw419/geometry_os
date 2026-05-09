; DESCRIPTION: Composite: Places a cyan dot at position (136, 26) then Draws a red circle centered at (350, 112) with radius 72.
; PLAN: r0=136(x), r1=26(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=112(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 26
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 112
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
