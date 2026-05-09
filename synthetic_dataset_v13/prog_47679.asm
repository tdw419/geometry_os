; DESCRIPTION: Composite: Places a magenta dot at position (37, 93) then Places a purple 109x31 rectangle at position (251, 54) then Places a blue circle of radius 58 at center (311, 70).
; PLAN: r0=37(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=54(y), r7=109(width), r8=31(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=70(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 54
LDI r7, 109
LDI r8, 31
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 70
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
