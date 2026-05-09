; DESCRIPTION: Composite: Sets a single magenta pixel at (508, 74) then Places a white line segment connecting (322, 134) to (408, 69) then Places a black 28x85 rectangle at position (355, 115).
; PLAN: r0=508(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=134(y1), r7=408(x2), r8=69(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=115(y), r12=28(width), r13=85(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 134
LDI r7, 408
LDI r8, 69
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 115
LDI r12, 28
LDI r13, 85
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
