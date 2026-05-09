; DESCRIPTION: Composite: Places a white circle of radius 72 at center (207, 113) then Places a orange line segment connecting (142, 236) to (458, 203) then Sets a single cyan pixel at (504, 100).
; PLAN: r0=207(x), r1=113(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=236(y1), r7=458(x2), r8=203(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=504(x), r11=100(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 113
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 236
LDI r7, 458
LDI r8, 203
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 100
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
