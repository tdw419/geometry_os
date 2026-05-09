; DESCRIPTION: Composite: Places a white dot at position (409, 167) then Draws a blue line from (247, 251) to (23, 202) then Places a red 82x42 rectangle at position (69, 9).
; PLAN: r0=409(x), r1=167(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=251(y1), r7=23(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=9(y), r12=82(width), r13=42(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 167
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 251
LDI r7, 23
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 9
LDI r12, 82
LDI r13, 42
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
