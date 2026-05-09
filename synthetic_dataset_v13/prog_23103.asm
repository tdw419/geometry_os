; DESCRIPTION: Composite: Draws a yellow line from (191, 75) to (415, 4) then Places a red 57x70 rectangle at position (160, 179).
; PLAN: r0=191(x1), r1=75(y1), r2=415(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=179(y), r7=57(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 75
LDI r2, 415
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 179
LDI r7, 57
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
