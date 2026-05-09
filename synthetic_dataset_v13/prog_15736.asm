; DESCRIPTION: Composite: Places a black dot at position (306, 115) then Places a blue line segment connecting (210, 246) to (439, 51) then Places a red 57x13 rectangle at position (180, 30).
; PLAN: r0=306(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=210(x1), r6=246(y1), r7=439(x2), r8=51(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=30(y), r12=57(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 210
LDI r6, 246
LDI r7, 439
LDI r8, 51
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 30
LDI r12, 57
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
