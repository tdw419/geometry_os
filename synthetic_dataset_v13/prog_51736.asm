; DESCRIPTION: Composite: Draws a yellow line from (389, 88) to (231, 123) then Places a cyan 63x100 rectangle at position (161, 107).
; PLAN: r0=389(x1), r1=88(y1), r2=231(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=107(y), r7=63(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 88
LDI r2, 231
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 107
LDI r7, 63
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
