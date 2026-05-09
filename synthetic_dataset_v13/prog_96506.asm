; DESCRIPTION: Composite: Draws a white line from (156, 100) to (356, 170) then Places a magenta dot at position (474, 66) then Draws a red circle centered at (206, 152) with radius 58.
; PLAN: r0=156(x1), r1=100(y1), r2=356(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=66(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=152(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 100
LDI r2, 356
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 66
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 152
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
