; DESCRIPTION: Composite: Sets a single blue pixel at (242, 181) then Places a yellow 64x115 rectangle at position (149, 122) then Places a green line segment connecting (376, 66) to (446, 176).
; PLAN: r0=242(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=122(y), r7=64(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x1), r11=66(y1), r12=446(x2), r13=176(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 122
LDI r7, 64
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 66
LDI r12, 446
LDI r13, 176
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
