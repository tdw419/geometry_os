; DESCRIPTION: Composite: Sets a single magenta pixel at (117, 13) then Creates a magenta circular shape at (469, 119) with radius 42 then Draws a blue line from (187, 61) to (288, 206).
; PLAN: r0=117(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=119(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x1), r11=61(y1), r12=288(x2), r13=206(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 119
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 61
LDI r12, 288
LDI r13, 206
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
