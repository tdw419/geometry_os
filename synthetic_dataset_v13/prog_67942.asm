; DESCRIPTION: Composite: Sets a single black pixel at (243, 255) then Draws a blue circle centered at (338, 169) with radius 70.
; PLAN: r0=243(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=169(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 338
LDI r6, 169
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
