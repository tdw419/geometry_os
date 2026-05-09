; DESCRIPTION: Composite: Draws a purple line from (345, 119) to (111, 63) then Places a blue 58x94 rectangle at position (7, 100).
; PLAN: r0=345(x1), r1=119(y1), r2=111(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=100(y), r7=58(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 119
LDI r2, 111
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 100
LDI r7, 58
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
