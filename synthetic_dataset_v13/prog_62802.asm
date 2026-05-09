; DESCRIPTION: Composite: Renders a black box of size 80x10 starting at (179, 64) then Sets a single magenta pixel at (294, 238) then Renders a white line between points (276, 255) and (366, 6).
; PLAN: r0=179(x), r1=64(y), r2=80(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=238(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=276(x1), r11=255(y1), r12=366(x2), r13=6(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 64
LDI r2, 80
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 238
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 255
LDI r12, 366
LDI r13, 6
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
