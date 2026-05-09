; DESCRIPTION: Composite: Places a white line segment connecting (342, 26) to (436, 207) then Draws a yellow circle centered at (356, 207) with radius 14 then Places a green dot at position (320, 145).
; PLAN: r0=342(x1), r1=26(y1), r2=436(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=207(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x), r11=145(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 26
LDI r2, 436
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 207
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 145
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
