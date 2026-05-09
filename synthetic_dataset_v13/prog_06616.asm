; DESCRIPTION: Composite: Sets a single blue pixel at (71, 205) then Places a purple 107x113 rectangle at position (40, 77) then Renders a orange line between points (70, 199) and (387, 208).
; PLAN: r0=71(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=77(y), r7=107(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x1), r11=199(y1), r12=387(x2), r13=208(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 77
LDI r7, 107
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 199
LDI r12, 387
LDI r13, 208
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
