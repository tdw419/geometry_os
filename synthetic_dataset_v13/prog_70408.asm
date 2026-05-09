; DESCRIPTION: Draws a magenta line from (375, 139) to (498, 166).
; PLAN: r0=375(x1), r1=139(y1), r2=498(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 139
LDI r2, 498
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
