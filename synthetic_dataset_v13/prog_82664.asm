; DESCRIPTION: Composite: Places a yellow line segment connecting (120, 200) to (275, 98) then Draws a green circle centered at (377, 128) with radius 29 then Places a white dot at position (289, 209).
; PLAN: r0=120(x1), r1=200(y1), r2=275(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=128(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=209(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 200
LDI r2, 275
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 128
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 209
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
