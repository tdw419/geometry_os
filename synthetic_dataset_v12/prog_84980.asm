; DESCRIPTION: Composite: Renders a black box of size 86x78 starting at (3, 72) then Draws a yellow line from (85, 252) to (268, 193).
; PLAN: r0=3(x), r1=72(y), r2=86(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=252(y1), r7=268(x2), r8=193(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 72
LDI r2, 86
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 252
LDI r7, 268
LDI r8, 193
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
