; DESCRIPTION: Composite: Places a red 73x12 rectangle at position (361, 120) then Draws a orange line from (507, 201) to (241, 178) then Sets a single purple pixel at (397, 143).
; PLAN: r0=361(x), r1=120(y), r2=73(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=201(y1), r7=241(x2), r8=178(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=143(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 120
LDI r2, 73
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 201
LDI r7, 241
LDI r8, 178
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 143
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
