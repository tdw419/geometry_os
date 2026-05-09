; DESCRIPTION: Composite: Places a blue dot at position (288, 186) then Draws a white circle centered at (116, 187) with radius 56.
; PLAN: r0=288(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=187(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 116
LDI r6, 187
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
