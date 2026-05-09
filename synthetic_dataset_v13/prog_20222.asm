; DESCRIPTION: Composite: Draws a cyan line from (444, 128) to (161, 53) then Draws a purple rectangle at (283, 99) with width 72 and height 26.
; PLAN: r0=444(x1), r1=128(y1), r2=161(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=99(y), r7=72(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 128
LDI r2, 161
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 99
LDI r7, 72
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
