; DESCRIPTION: Composite: Places a yellow dot at position (314, 58) then Creates a white circular shape at (443, 70) with radius 44 then Draws a red line from (375, 97) to (27, 56).
; PLAN: r0=314(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=70(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=375(x1), r11=97(y1), r12=27(x2), r13=56(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 443
LDI r6, 70
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 375
LDI r11, 97
LDI r12, 27
LDI r13, 56
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
