; DESCRIPTION: Composite: Places a cyan 96x115 rectangle at position (74, 3) then Draws a green line from (188, 211) to (166, 181).
; PLAN: r0=74(x), r1=3(y), r2=96(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x1), r6=211(y1), r7=166(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 3
LDI r2, 96
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 211
LDI r7, 166
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
