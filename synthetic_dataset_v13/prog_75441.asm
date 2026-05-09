; DESCRIPTION: Composite: Sets a single yellow pixel at (270, 120) then Draws a black line from (224, 143) to (435, 178) then Places a black 97x15 rectangle at position (61, 219).
; PLAN: r0=270(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=224(x1), r6=143(y1), r7=435(x2), r8=178(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=219(y), r12=97(width), r13=15(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 143
LDI r7, 435
LDI r8, 178
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 219
LDI r12, 97
LDI r13, 15
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
