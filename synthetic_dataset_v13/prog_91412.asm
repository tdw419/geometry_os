; DESCRIPTION: Composite: Places a red line segment connecting (359, 128) to (179, 197) then Places a cyan circle of radius 24 at center (413, 117) then Creates a orange rectangular region at (309, 215) spanning 31 by 25 pixels.
; PLAN: r0=359(x1), r1=128(y1), r2=179(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=117(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=215(y), r12=31(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 128
LDI r2, 179
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 117
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 215
LDI r12, 31
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
