; DESCRIPTION: Composite: Places a purple dot at position (75, 115) then Creates a magenta rectangular region at (264, 117) spanning 111 by 76 pixels then Renders a orange line between points (320, 11) and (165, 64).
; PLAN: r0=75(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=117(y), r7=111(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x1), r11=11(y1), r12=165(x2), r13=64(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 117
LDI r7, 111
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 11
LDI r12, 165
LDI r13, 64
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
