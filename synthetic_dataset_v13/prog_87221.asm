; DESCRIPTION: Composite: Places a yellow 42x70 rectangle at position (142, 177) then Draws a magenta line from (161, 164) to (140, 251).
; PLAN: r0=142(x), r1=177(y), r2=42(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x1), r6=164(y1), r7=140(x2), r8=251(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 177
LDI r2, 42
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 164
LDI r7, 140
LDI r8, 251
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
