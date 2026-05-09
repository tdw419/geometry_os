; DESCRIPTION: Composite: Places a blue line segment connecting (102, 173) to (46, 82) then Places a magenta 64x92 rectangle at position (256, 51) then Sets a single orange pixel at (249, 49).
; PLAN: r0=102(x1), r1=173(y1), r2=46(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=51(y), r7=64(width), r8=92(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=49(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 102
LDI r1, 173
LDI r2, 46
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 51
LDI r7, 64
LDI r8, 92
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 49
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
