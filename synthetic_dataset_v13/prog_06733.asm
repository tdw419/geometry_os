; DESCRIPTION: Composite: Places a red 98x37 rectangle at position (135, 65) then Sets a single cyan pixel at (483, 7) then Places a green line segment connecting (61, 76) to (342, 44).
; PLAN: r0=135(x), r1=65(y), r2=98(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x), r6=7(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=61(x1), r11=76(y1), r12=342(x2), r13=44(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 65
LDI r2, 98
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 7
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 61
LDI r11, 76
LDI r12, 342
LDI r13, 44
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
