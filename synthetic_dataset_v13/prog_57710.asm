; DESCRIPTION: Composite: Sets a single yellow pixel at (187, 64) then Places a white 83x99 rectangle at position (356, 50) then Draws a blue line from (101, 126) to (247, 68).
; PLAN: r0=187(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=50(y), r7=83(width), r8=99(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x1), r11=126(y1), r12=247(x2), r13=68(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 356
LDI r6, 50
LDI r7, 83
LDI r8, 99
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 126
LDI r12, 247
LDI r13, 68
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
