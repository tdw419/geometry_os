; DESCRIPTION: Composite: Sets a single orange pixel at (195, 184) then Draws a black rectangle at (60, 162) with width 31 and height 19 then Draws a white line from (372, 161) to (133, 219).
; PLAN: r0=195(x), r1=184(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=162(y), r7=31(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x1), r11=161(y1), r12=133(x2), r13=219(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 184
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 60
LDI r6, 162
LDI r7, 31
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 161
LDI r12, 133
LDI r13, 219
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
