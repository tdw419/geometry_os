; DESCRIPTION: Composite: Places a magenta dot at position (238, 209) then Draws a magenta line from (72, 251) to (192, 64) then Places a cyan 118x119 rectangle at position (252, 84).
; PLAN: r0=238(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=251(y1), r7=192(x2), r8=64(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=84(y), r12=118(width), r13=119(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 251
LDI r7, 192
LDI r8, 64
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 84
LDI r12, 118
LDI r13, 119
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
