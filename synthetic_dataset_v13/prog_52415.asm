; DESCRIPTION: Composite: Draws a magenta line from (158, 112) to (174, 13) then Places a yellow 39x78 rectangle at position (19, 140).
; PLAN: r0=158(x1), r1=112(y1), r2=174(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=140(y), r7=39(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 112
LDI r2, 174
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 140
LDI r7, 39
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
