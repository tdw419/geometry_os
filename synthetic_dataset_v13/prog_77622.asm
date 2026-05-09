; DESCRIPTION: Composite: Sets a single purple pixel at (27, 60) then Places a orange 42x27 rectangle at position (431, 212) then Draws a green line from (58, 245) to (184, 53).
; PLAN: r0=27(x), r1=60(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=212(y), r7=42(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x1), r11=245(y1), r12=184(x2), r13=53(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 60
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 212
LDI r7, 42
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 245
LDI r12, 184
LDI r13, 53
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
