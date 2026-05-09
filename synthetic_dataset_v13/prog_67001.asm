; DESCRIPTION: Composite: Places a orange dot at position (113, 142) then Renders a yellow box of size 97x64 starting at (226, 58) then Renders a black line between points (340, 187) and (347, 141).
; PLAN: r0=113(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=58(y), r7=97(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x1), r11=187(y1), r12=347(x2), r13=141(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 226
LDI r6, 58
LDI r7, 97
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 187
LDI r12, 347
LDI r13, 141
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
