; DESCRIPTION: Composite: Places a white line segment connecting (393, 195) to (411, 45) then Creates a yellow rectangular region at (325, 176) spanning 35 by 72 pixels.
; PLAN: r0=393(x1), r1=195(y1), r2=411(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=176(y), r7=35(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 195
LDI r2, 411
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 176
LDI r7, 35
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
