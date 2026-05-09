; DESCRIPTION: Composite: Draws a cyan line from (104, 235) to (476, 14) then Places a red 92x93 rectangle at position (347, 70).
; PLAN: r0=104(x1), r1=235(y1), r2=476(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=70(y), r7=92(width), r8=93(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 235
LDI r2, 476
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 70
LDI r7, 92
LDI r8, 93
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
