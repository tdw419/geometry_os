; DESCRIPTION: Composite: Draws a purple circle centered at (469, 77) with radius 30 then Renders a green line between points (263, 232) and (437, 41) then Places a cyan 86x79 rectangle at position (357, 139).
; PLAN: r0=469(x), r1=77(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=232(y1), r7=437(x2), r8=41(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=139(y), r12=86(width), r13=79(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 77
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 232
LDI r7, 437
LDI r8, 41
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 139
LDI r12, 86
LDI r13, 79
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
