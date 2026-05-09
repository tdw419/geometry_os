; DESCRIPTION: Composite: Draws a magenta line from (225, 90) to (16, 202) then Places a magenta dot at position (169, 105) then Creates a white rectangular region at (74, 128) spanning 28 by 33 pixels.
; PLAN: r0=225(x1), r1=90(y1), r2=16(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=105(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=128(y), r12=28(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 90
LDI r2, 16
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 105
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 74
LDI r11, 128
LDI r12, 28
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
