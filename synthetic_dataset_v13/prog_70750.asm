; DESCRIPTION: Composite: Draws a white line from (319, 20) to (24, 218) then Places a black dot at position (53, 126) then Places a green 23x80 rectangle at position (38, 175).
; PLAN: r0=319(x1), r1=20(y1), r2=24(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=175(y), r12=23(width), r13=80(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 20
LDI r2, 24
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 38
LDI r11, 175
LDI r12, 23
LDI r13, 80
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
