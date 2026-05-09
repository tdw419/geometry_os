; DESCRIPTION: Composite: Places a white 95x12 rectangle at position (24, 46) then Places a orange line segment connecting (163, 70) to (373, 171) then Places a cyan dot at position (278, 105).
; PLAN: r0=24(x), r1=46(y), r2=95(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x1), r6=70(y1), r7=373(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=278(x), r11=105(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 46
LDI r2, 95
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 70
LDI r7, 373
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 105
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
