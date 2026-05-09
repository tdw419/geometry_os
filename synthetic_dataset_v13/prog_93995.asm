; DESCRIPTION: Composite: Places a green 74x64 rectangle at position (167, 80) then Places a black dot at position (373, 121) then Places a yellow line segment connecting (235, 175) to (392, 123).
; PLAN: r0=167(x), r1=80(y), r2=74(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=121(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=235(x1), r11=175(y1), r12=392(x2), r13=123(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 80
LDI r2, 74
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 121
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 235
LDI r11, 175
LDI r12, 392
LDI r13, 123
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
