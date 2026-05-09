; DESCRIPTION: Composite: Places a black 84x106 rectangle at position (247, 132) then Places a orange line segment connecting (197, 99) to (102, 243).
; PLAN: r0=247(x), r1=132(y), r2=84(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x1), r6=99(y1), r7=102(x2), r8=243(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 132
LDI r2, 84
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 99
LDI r7, 102
LDI r8, 243
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
