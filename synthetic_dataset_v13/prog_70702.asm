; DESCRIPTION: Composite: Places a blue dot at position (45, 12) then Draws a magenta line from (90, 253) to (134, 162) then Draws a white circle centered at (177, 135) with radius 60.
; PLAN: r0=45(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=253(y1), r7=134(x2), r8=162(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=135(y), r12=60(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 253
LDI r7, 134
LDI r8, 162
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 135
LDI r12, 60
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
