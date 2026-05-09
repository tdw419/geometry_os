; DESCRIPTION: Composite: Places a cyan 10x49 rectangle at position (316, 147) then Places a blue dot at position (447, 157) then Renders a red line between points (100, 163) and (467, 80).
; PLAN: r0=316(x), r1=147(y), r2=10(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=157(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=100(x1), r11=163(y1), r12=467(x2), r13=80(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 147
LDI r2, 10
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 157
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 100
LDI r11, 163
LDI r12, 467
LDI r13, 80
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
