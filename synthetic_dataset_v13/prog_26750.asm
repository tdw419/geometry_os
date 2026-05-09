; DESCRIPTION: Composite: Renders a yellow box of size 92x14 starting at (133, 228) then Sets a single purple pixel at (148, 3) then Renders a black line between points (14, 7) and (167, 231).
; PLAN: r0=133(x), r1=228(y), r2=92(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=3(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=14(x1), r11=7(y1), r12=167(x2), r13=231(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 228
LDI r2, 92
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 3
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 14
LDI r11, 7
LDI r12, 167
LDI r13, 231
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
