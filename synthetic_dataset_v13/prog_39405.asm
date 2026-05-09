; DESCRIPTION: Composite: Places a cyan dot at position (413, 60) then Creates a white circular shape at (141, 73) with radius 50 then Draws a yellow line from (333, 203) to (232, 165).
; PLAN: r0=413(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=73(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x1), r11=203(y1), r12=232(x2), r13=165(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 73
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 203
LDI r12, 232
LDI r13, 165
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
