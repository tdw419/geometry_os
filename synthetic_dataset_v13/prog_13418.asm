; DESCRIPTION: Composite: Places a white dot at position (405, 19) then Places a blue line segment connecting (509, 69) to (79, 151) then Creates a orange rectangular region at (51, 57) spanning 100 by 91 pixels.
; PLAN: r0=405(x), r1=19(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=69(y1), r7=79(x2), r8=151(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=57(y), r12=100(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 19
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 69
LDI r7, 79
LDI r8, 151
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 57
LDI r12, 100
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
