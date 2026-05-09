; DESCRIPTION: Composite: Places a magenta 90x103 rectangle at position (351, 88) then Sets a single magenta pixel at (458, 18) then Places a cyan line segment connecting (472, 150) to (292, 204).
; PLAN: r0=351(x), r1=88(y), r2=90(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=18(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=472(x1), r11=150(y1), r12=292(x2), r13=204(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 88
LDI r2, 90
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 18
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 472
LDI r11, 150
LDI r12, 292
LDI r13, 204
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
