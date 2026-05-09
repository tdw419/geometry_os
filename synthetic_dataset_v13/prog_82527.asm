; DESCRIPTION: Composite: Places a magenta dot at position (299, 96) then Draws a green line from (65, 65) to (376, 225) then Draws a green circle centered at (383, 170) with radius 48.
; PLAN: r0=299(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=65(y1), r7=376(x2), r8=225(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=170(y), r12=48(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 65
LDI r7, 376
LDI r8, 225
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 170
LDI r12, 48
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
