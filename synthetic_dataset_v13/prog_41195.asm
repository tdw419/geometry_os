; DESCRIPTION: Composite: Sets a single green pixel at (340, 252) then Places a cyan 116x11 rectangle at position (145, 165) then Draws a green line from (122, 6) to (28, 140).
; PLAN: r0=340(x), r1=252(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=165(y), r7=116(width), r8=11(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x1), r11=6(y1), r12=28(x2), r13=140(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 252
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 145
LDI r6, 165
LDI r7, 116
LDI r8, 11
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 6
LDI r12, 28
LDI r13, 140
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
