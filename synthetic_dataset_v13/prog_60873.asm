; DESCRIPTION: Composite: Renders a cyan box of size 54x89 starting at (314, 32) then Places a purple dot at position (88, 95) then Draws a white line from (221, 15) to (379, 68).
; PLAN: r0=314(x), r1=32(y), r2=54(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=95(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=221(x1), r11=15(y1), r12=379(x2), r13=68(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 32
LDI r2, 54
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 95
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 221
LDI r11, 15
LDI r12, 379
LDI r13, 68
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
