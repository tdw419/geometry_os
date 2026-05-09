; DESCRIPTION: Composite: Places a red line segment connecting (448, 77) to (264, 220) then Places a red 47x13 rectangle at position (125, 189) then Sets a single black pixel at (393, 224).
; PLAN: r0=448(x1), r1=77(y1), r2=264(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=189(y), r7=47(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x), r11=224(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 77
LDI r2, 264
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 189
LDI r7, 47
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 224
LDI r12, 0x000000
PSET r10, r11, r12
HALT
