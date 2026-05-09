; DESCRIPTION: Composite: Places a cyan dot at position (503, 176) then Places a red line segment connecting (373, 72) to (142, 244) then Draws a purple circle centered at (91, 175) with radius 28.
; PLAN: r0=503(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=72(y1), r7=142(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=175(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 503
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 72
LDI r7, 142
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 175
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
