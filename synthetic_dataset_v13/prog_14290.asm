; DESCRIPTION: Composite: Places a green dot at position (303, 178) then Draws a white circle centered at (129, 37) with radius 31.
; PLAN: r0=303(x), r1=178(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=37(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 178
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 129
LDI r6, 37
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
