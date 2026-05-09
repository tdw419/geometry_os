; DESCRIPTION: Composite: Places a white line segment connecting (44, 243) to (128, 214) then Places a red circle of radius 70 at center (259, 156) then Places a white dot at position (408, 191).
; PLAN: r0=44(x1), r1=243(y1), r2=128(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=156(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=191(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 243
LDI r2, 128
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 156
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 191
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
