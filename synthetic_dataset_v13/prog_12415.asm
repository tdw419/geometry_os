; DESCRIPTION: Composite: Draws a black circle centered at (394, 78) with radius 67 then Draws a cyan line from (83, 90) to (276, 136) then Sets a single black pixel at (502, 176).
; PLAN: r0=394(x), r1=78(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x1), r6=90(y1), r7=276(x2), r8=136(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=502(x), r11=176(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 78
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 90
LDI r7, 276
LDI r8, 136
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 176
LDI r12, 0x000000
PSET r10, r11, r12
HALT
