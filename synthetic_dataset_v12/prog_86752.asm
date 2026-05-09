; DESCRIPTION: Composite: Draws a magenta line from (480, 177) to (476, 227) then Places a blue 95x52 rectangle at position (54, 119).
; PLAN: r0=480(x1), r1=177(y1), r2=476(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=119(y), r7=95(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 177
LDI r2, 476
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 119
LDI r7, 95
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
