; DESCRIPTION: Composite: Renders a magenta line between points (49, 52) and (392, 152) then Creates a blue rectangular region at (280, 112) spanning 117 by 16 pixels then Sets a single black pixel at (100, 31).
; PLAN: r0=49(x1), r1=52(y1), r2=392(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=112(y), r7=117(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=31(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 52
LDI r2, 392
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 112
LDI r7, 117
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 31
LDI r12, 0x000000
PSET r10, r11, r12
HALT
