; DESCRIPTION: Composite: Places a yellow 11x27 rectangle at position (2, 222) then Places a red line segment connecting (276, 157) to (89, 93) then Places a yellow dot at position (192, 104).
; PLAN: r0=2(x), r1=222(y), r2=11(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=157(y1), r7=89(x2), r8=93(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=104(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 222
LDI r2, 11
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 157
LDI r7, 89
LDI r8, 93
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 104
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
