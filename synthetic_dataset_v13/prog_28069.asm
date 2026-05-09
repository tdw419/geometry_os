; DESCRIPTION: Composite: Places a magenta 56x51 rectangle at position (255, 83) then Places a orange line segment connecting (441, 33) to (511, 68).
; PLAN: r0=255(x), r1=83(y), r2=56(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x1), r6=33(y1), r7=511(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 83
LDI r2, 56
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 33
LDI r7, 511
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
