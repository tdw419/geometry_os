; DESCRIPTION: Composite: Draws a green line from (121, 20) to (356, 48) then Places a magenta dot at position (96, 126) then Places a purple 78x45 rectangle at position (336, 130).
; PLAN: r0=121(x1), r1=20(y1), r2=356(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=126(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=130(y), r12=78(width), r13=45(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 20
LDI r2, 356
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 126
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 336
LDI r11, 130
LDI r12, 78
LDI r13, 45
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
