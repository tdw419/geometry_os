; DESCRIPTION: Composite: Places a white line segment connecting (32, 223) to (356, 249) then Sets a single green pixel at (411, 184) then Places a orange 14x114 rectangle at position (306, 0).
; PLAN: r0=32(x1), r1=223(y1), r2=356(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=184(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=0(y), r12=14(width), r13=114(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 223
LDI r2, 356
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 184
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 306
LDI r11, 0
LDI r12, 14
LDI r13, 114
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
