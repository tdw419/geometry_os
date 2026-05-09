; DESCRIPTION: Composite: Places a purple 28x87 rectangle at position (116, 10) then Draws a orange line from (27, 98) to (12, 103) then Draws a cyan circle centered at (427, 115) with radius 36.
; PLAN: r0=116(x), r1=10(y), r2=28(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=98(y1), r7=12(x2), r8=103(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=115(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 10
LDI r2, 28
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 98
LDI r7, 12
LDI r8, 103
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 115
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
