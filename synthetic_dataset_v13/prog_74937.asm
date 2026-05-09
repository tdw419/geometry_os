; DESCRIPTION: Composite: Places a white dot at position (321, 199) then Renders a magenta line between points (392, 116) and (37, 200) then Creates a purple rectangular region at (386, 46) spanning 33 by 69 pixels.
; PLAN: r0=321(x), r1=199(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=116(y1), r7=37(x2), r8=200(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=46(y), r12=33(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 199
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 116
LDI r7, 37
LDI r8, 200
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 46
LDI r12, 33
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
