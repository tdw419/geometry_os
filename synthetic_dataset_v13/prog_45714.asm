; DESCRIPTION: Composite: Places a cyan line segment connecting (70, 163) to (140, 142) then Draws a red circle centered at (436, 57) with radius 26 then Sets a single green pixel at (396, 227).
; PLAN: r0=70(x1), r1=163(y1), r2=140(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=57(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=227(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 163
LDI r2, 140
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 57
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 227
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
