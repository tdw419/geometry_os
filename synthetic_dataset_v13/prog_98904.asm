; DESCRIPTION: Composite: Places a red dot at position (499, 7) then Creates a magenta rectangular region at (280, 56) spanning 114 by 109 pixels then Draws a magenta line from (326, 18) to (415, 250).
; PLAN: r0=499(x), r1=7(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=56(y), r7=114(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x1), r11=18(y1), r12=415(x2), r13=250(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 7
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 56
LDI r7, 114
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 18
LDI r12, 415
LDI r13, 250
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
