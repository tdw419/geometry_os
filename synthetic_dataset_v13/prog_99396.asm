; DESCRIPTION: Composite: Places a purple 32x32 rectangle at position (442, 167) then Draws a cyan line from (248, 240) to (352, 205).
; PLAN: r0=442(x), r1=167(y), r2=32(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x1), r6=240(y1), r7=352(x2), r8=205(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 167
LDI r2, 32
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 240
LDI r7, 352
LDI r8, 205
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
