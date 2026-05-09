; DESCRIPTION: Composite: Places a magenta dot at position (257, 56) then Places a black 95x93 rectangle at position (242, 134) then Places a white line segment connecting (256, 110) to (152, 157).
; PLAN: r0=257(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=134(y), r7=95(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x1), r11=110(y1), r12=152(x2), r13=157(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 134
LDI r7, 95
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 110
LDI r12, 152
LDI r13, 157
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
