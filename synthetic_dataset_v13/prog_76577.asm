; DESCRIPTION: Composite: Sets a single magenta pixel at (268, 62) then Draws a white line from (250, 3) to (412, 85) then Places a magenta 115x39 rectangle at position (74, 109).
; PLAN: r0=268(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=250(x1), r6=3(y1), r7=412(x2), r8=85(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=109(y), r12=115(width), r13=39(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 250
LDI r6, 3
LDI r7, 412
LDI r8, 85
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 109
LDI r12, 115
LDI r13, 39
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
