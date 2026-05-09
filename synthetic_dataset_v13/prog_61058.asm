; DESCRIPTION: Composite: Places a orange dot at position (480, 83) then Creates a white circular shape at (127, 105) with radius 72 then Places a black line segment connecting (425, 84) to (107, 48).
; PLAN: r0=480(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=105(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x1), r11=84(y1), r12=107(x2), r13=48(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 127
LDI r6, 105
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 84
LDI r12, 107
LDI r13, 48
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
