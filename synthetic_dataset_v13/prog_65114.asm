; DESCRIPTION: Composite: Places a white circle of radius 66 at center (178, 143) then Places a cyan line segment connecting (214, 50) to (236, 145) then Sets a single cyan pixel at (249, 108).
; PLAN: r0=178(x), r1=143(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x1), r6=50(y1), r7=236(x2), r8=145(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=108(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 143
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 50
LDI r7, 236
LDI r8, 145
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 108
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
