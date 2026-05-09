; DESCRIPTION: Composite: Places a red line segment connecting (61, 35) to (51, 164) then Places a yellow 79x66 rectangle at position (344, 22).
; PLAN: r0=61(x1), r1=35(y1), r2=51(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=22(y), r7=79(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 35
LDI r2, 51
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 22
LDI r7, 79
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
