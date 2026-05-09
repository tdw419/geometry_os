; DESCRIPTION: Composite: Places a blue line segment connecting (161, 214) to (136, 48) then Places a white dot at position (463, 131) then Places a blue 24x46 rectangle at position (60, 80).
; PLAN: r0=161(x1), r1=214(y1), r2=136(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=131(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=80(y), r12=24(width), r13=46(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 214
LDI r2, 136
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 131
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 60
LDI r11, 80
LDI r12, 24
LDI r13, 46
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
