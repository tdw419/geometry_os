; DESCRIPTION: Composite: Creates a blue rectangular region at (79, 27) spanning 92 by 18 pixels then Renders a yellow line between points (444, 143) and (61, 58) then Places a green dot at position (448, 200).
; PLAN: r0=79(x), r1=27(y), r2=92(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x1), r6=143(y1), r7=61(x2), r8=58(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=200(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 27
LDI r2, 92
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 143
LDI r7, 61
LDI r8, 58
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 200
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
