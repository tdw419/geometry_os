; DESCRIPTION: Composite: Places a blue dot at position (333, 224) then Places a cyan 16x109 rectangle at position (67, 79) then Draws a white line from (497, 118) to (423, 176).
; PLAN: r0=333(x), r1=224(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=79(y), r7=16(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=118(y1), r12=423(x2), r13=176(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 224
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 79
LDI r7, 16
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 118
LDI r12, 423
LDI r13, 176
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
