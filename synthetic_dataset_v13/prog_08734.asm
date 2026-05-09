; DESCRIPTION: Composite: Sets a single orange pixel at (469, 42) then Renders a white line between points (366, 255) and (350, 134) then Places a cyan 105x19 rectangle at position (355, 196).
; PLAN: r0=469(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=366(x1), r6=255(y1), r7=350(x2), r8=134(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=196(y), r12=105(width), r13=19(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 42
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 366
LDI r6, 255
LDI r7, 350
LDI r8, 134
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 196
LDI r12, 105
LDI r13, 19
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
