; DESCRIPTION: Composite: Places a magenta 89x12 rectangle at position (162, 241) then Draws a white line from (333, 141) to (107, 32).
; PLAN: r0=162(x), r1=241(y), r2=89(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=141(y1), r7=107(x2), r8=32(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 241
LDI r2, 89
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 141
LDI r7, 107
LDI r8, 32
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
