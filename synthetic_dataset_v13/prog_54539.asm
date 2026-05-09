; DESCRIPTION: Composite: Sets a single purple pixel at (353, 62) then Places a white 42x91 rectangle at position (181, 145) then Renders a magenta line between points (87, 161) and (248, 184).
; PLAN: r0=353(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=145(y), r7=42(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x1), r11=161(y1), r12=248(x2), r13=184(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 62
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 145
LDI r7, 42
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 161
LDI r12, 248
LDI r13, 184
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
