; DESCRIPTION: Composite: Places a orange 58x97 rectangle at position (182, 69) then Places a white line segment connecting (82, 31) to (362, 163) then Sets a single green pixel at (419, 175).
; PLAN: r0=182(x), r1=69(y), r2=58(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x1), r6=31(y1), r7=362(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=175(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 69
LDI r2, 58
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 31
LDI r7, 362
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 175
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
