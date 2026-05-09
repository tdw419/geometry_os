; DESCRIPTION: Composite: Places a yellow line segment connecting (181, 180) to (101, 163) then Places a white dot at position (291, 171) then Places a magenta 38x115 rectangle at position (166, 0).
; PLAN: r0=181(x1), r1=180(y1), r2=101(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=171(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=166(x), r11=0(y), r12=38(width), r13=115(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 180
LDI r2, 101
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 171
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 166
LDI r11, 0
LDI r12, 38
LDI r13, 115
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
