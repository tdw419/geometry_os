; DESCRIPTION: Composite: Places a cyan line segment connecting (183, 242) to (504, 184) then Sets a single blue pixel at (161, 30) then Draws a yellow rectangle at (327, 189) with width 50 and height 61.
; PLAN: r0=183(x1), r1=242(y1), r2=504(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=30(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=189(y), r12=50(width), r13=61(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 242
LDI r2, 504
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 30
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 189
LDI r12, 50
LDI r13, 61
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
