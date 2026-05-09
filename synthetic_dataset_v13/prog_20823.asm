; DESCRIPTION: Composite: Places a white dot at position (256, 42) then Draws a blue line from (365, 56) to (331, 255) then Renders a magenta box of size 19x103 starting at (339, 6).
; PLAN: r0=256(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=365(x1), r6=56(y1), r7=331(x2), r8=255(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=6(y), r12=19(width), r13=103(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 42
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 365
LDI r6, 56
LDI r7, 331
LDI r8, 255
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 6
LDI r12, 19
LDI r13, 103
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
