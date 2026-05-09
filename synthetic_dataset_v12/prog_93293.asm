; DESCRIPTION: Composite: Places a white 72x23 rectangle at position (68, 64) then Places a blue dot at position (511, 129) then Places a green line segment connecting (146, 232) to (119, 152).
; PLAN: r0=68(x), r1=64(y), r2=72(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=129(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=146(x1), r11=232(y1), r12=119(x2), r13=152(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 64
LDI r2, 72
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 129
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 232
LDI r12, 119
LDI r13, 152
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
