; DESCRIPTION: Composite: Places a black line segment connecting (147, 206) to (44, 114) then Places a cyan dot at position (403, 203) then Creates a red rectangular region at (178, 163) spanning 120 by 73 pixels.
; PLAN: r0=147(x1), r1=206(y1), r2=44(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=203(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=178(x), r11=163(y), r12=120(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 206
LDI r2, 44
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 203
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 178
LDI r11, 163
LDI r12, 120
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
