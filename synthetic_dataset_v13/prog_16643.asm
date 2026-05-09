; DESCRIPTION: Composite: Places a white circle of radius 42 at center (356, 196) then Renders a black box of size 101x63 starting at (85, 56) then Renders a black line between points (208, 126) and (308, 193).
; PLAN: r0=356(x), r1=196(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=56(y), r7=101(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x1), r11=126(y1), r12=308(x2), r13=193(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 196
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 56
LDI r7, 101
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 126
LDI r12, 308
LDI r13, 193
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
