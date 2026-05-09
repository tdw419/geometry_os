; DESCRIPTION: Composite: Places a white dot at position (4, 99) then Draws a white line from (126, 59) to (396, 209) then Creates a purple rectangular region at (52, 3) spanning 46 by 80 pixels.
; PLAN: r0=4(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=126(x1), r6=59(y1), r7=396(x2), r8=209(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=52(x), r11=3(y), r12=46(width), r13=80(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 59
LDI r7, 396
LDI r8, 209
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 3
LDI r12, 46
LDI r13, 80
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
