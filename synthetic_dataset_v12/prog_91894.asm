; DESCRIPTION: Composite: Renders a red line between points (447, 153) and (195, 202) then Places a purple dot at position (104, 77) then Renders a green box of size 103x72 starting at (48, 77).
; PLAN: r0=447(x1), r1=153(y1), r2=195(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=77(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=48(x), r11=77(y), r12=103(width), r13=72(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 153
LDI r2, 195
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 77
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 48
LDI r11, 77
LDI r12, 103
LDI r13, 72
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
