; DESCRIPTION: Composite: Sets a single black pixel at (234, 213) then Draws a purple line from (30, 145) to (104, 35) then Places a orange 34x70 rectangle at position (117, 124).
; PLAN: r0=234(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=145(y1), r7=104(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=124(y), r12=34(width), r13=70(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 30
LDI r6, 145
LDI r7, 104
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 124
LDI r12, 34
LDI r13, 70
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
