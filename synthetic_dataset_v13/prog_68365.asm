; DESCRIPTION: Composite: Places a cyan 26x105 rectangle at position (101, 122) then Draws a yellow line from (69, 19) to (227, 128).
; PLAN: r0=101(x), r1=122(y), r2=26(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=19(y1), r7=227(x2), r8=128(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 122
LDI r2, 26
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 19
LDI r7, 227
LDI r8, 128
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
