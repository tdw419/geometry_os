; DESCRIPTION: Composite: Renders a purple line between points (68, 78) and (308, 195) then Sets a single white pixel at (506, 235) then Places a purple 82x61 rectangle at position (240, 164).
; PLAN: r0=68(x1), r1=78(y1), r2=308(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=235(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=164(y), r12=82(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 78
LDI r2, 308
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 235
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 240
LDI r11, 164
LDI r12, 82
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
