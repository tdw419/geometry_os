; DESCRIPTION: Composite: Draws a green line from (144, 62) to (204, 175) then Places a cyan 10x88 rectangle at position (311, 127).
; PLAN: r0=144(x1), r1=62(y1), r2=204(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=127(y), r7=10(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 62
LDI r2, 204
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 127
LDI r7, 10
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
