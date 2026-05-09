; DESCRIPTION: Composite: Draws a white line from (216, 18) to (100, 227) then Places a magenta 107x113 rectangle at position (199, 7).
; PLAN: r0=216(x1), r1=18(y1), r2=100(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=7(y), r7=107(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 18
LDI r2, 100
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 7
LDI r7, 107
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
