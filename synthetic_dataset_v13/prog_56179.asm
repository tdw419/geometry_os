; DESCRIPTION: Composite: Places a black dot at position (189, 64) then Places a cyan 98x95 rectangle at position (206, 83) then Places a orange line segment connecting (419, 127) to (375, 156).
; PLAN: r0=189(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=83(y), r7=98(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x1), r11=127(y1), r12=375(x2), r13=156(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 206
LDI r6, 83
LDI r7, 98
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 127
LDI r12, 375
LDI r13, 156
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
