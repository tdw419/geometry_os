; DESCRIPTION: Composite: Draws a white line from (22, 79) to (297, 86) then Places a cyan 39x42 rectangle at position (371, 186) then Sets a single blue pixel at (68, 151).
; PLAN: r0=22(x1), r1=79(y1), r2=297(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=186(y), r7=39(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=151(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 79
LDI r2, 297
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 186
LDI r7, 39
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 151
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
