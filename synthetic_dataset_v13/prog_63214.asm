; DESCRIPTION: Composite: Creates a magenta circular shape at (384, 153) with radius 66 then Places a white dot at position (105, 42) then Draws a blue line from (434, 31) to (23, 106).
; PLAN: r0=384(x), r1=153(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=42(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=434(x1), r11=31(y1), r12=23(x2), r13=106(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 153
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 42
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 434
LDI r11, 31
LDI r12, 23
LDI r13, 106
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
