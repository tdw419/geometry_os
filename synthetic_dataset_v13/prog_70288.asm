; DESCRIPTION: Composite: Draws a white rectangle at (1, 110) with width 27 and height 96 then Places a black dot at position (143, 93) then Draws a purple line from (140, 27) to (39, 116).
; PLAN: r0=1(x), r1=110(y), r2=27(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=93(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=140(x1), r11=27(y1), r12=39(x2), r13=116(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 110
LDI r2, 27
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 93
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 140
LDI r11, 27
LDI r12, 39
LDI r13, 116
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
