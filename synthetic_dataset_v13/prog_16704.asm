; DESCRIPTION: Composite: Places a red 33x48 rectangle at position (199, 201) then Draws a yellow line from (368, 198) to (70, 172).
; PLAN: r0=199(x), r1=201(y), r2=33(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=198(y1), r7=70(x2), r8=172(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 201
LDI r2, 33
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 198
LDI r7, 70
LDI r8, 172
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
