; DESCRIPTION: Composite: Draws a blue line from (499, 238) to (182, 81) then Places a green 56x103 rectangle at position (390, 63).
; PLAN: r0=499(x1), r1=238(y1), r2=182(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=63(y), r7=56(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 238
LDI r2, 182
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 63
LDI r7, 56
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
