; DESCRIPTION: Composite: Creates a white rectangular region at (77, 202) spanning 59 by 47 pixels then Places a green dot at position (508, 33) then Draws a black line from (162, 79) to (283, 61).
; PLAN: r0=77(x), r1=202(y), r2=59(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=33(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=162(x1), r11=79(y1), r12=283(x2), r13=61(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 202
LDI r2, 59
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 33
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 162
LDI r11, 79
LDI r12, 283
LDI r13, 61
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
