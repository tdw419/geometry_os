; DESCRIPTION: Composite: Places a white 58x35 rectangle at position (376, 2) then Draws a blue line from (458, 173) to (270, 224) then Places a magenta dot at position (481, 194).
; PLAN: r0=376(x), r1=2(y), r2=58(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x1), r6=173(y1), r7=270(x2), r8=224(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=481(x), r11=194(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 2
LDI r2, 58
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 173
LDI r7, 270
LDI r8, 224
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 194
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
