; DESCRIPTION: Composite: Draws a black line from (143, 2) to (24, 51) then Places a blue 118x25 rectangle at position (338, 13).
; PLAN: r0=143(x1), r1=2(y1), r2=24(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=13(y), r7=118(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 2
LDI r2, 24
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 13
LDI r7, 118
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
