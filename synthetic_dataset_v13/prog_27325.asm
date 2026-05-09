; DESCRIPTION: Composite: Draws a orange line from (169, 131) to (201, 148) then Places a yellow 66x16 rectangle at position (425, 63).
; PLAN: r0=169(x1), r1=131(y1), r2=201(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=63(y), r7=66(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 131
LDI r2, 201
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 63
LDI r7, 66
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
