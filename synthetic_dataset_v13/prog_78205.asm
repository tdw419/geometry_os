; DESCRIPTION: Composite: Draws a purple line from (404, 31) to (66, 207) then Places a white dot at position (149, 222) then Places a red 105x87 rectangle at position (289, 46).
; PLAN: r0=404(x1), r1=31(y1), r2=66(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=222(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=46(y), r12=105(width), r13=87(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 31
LDI r2, 66
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 222
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 289
LDI r11, 46
LDI r12, 105
LDI r13, 87
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
