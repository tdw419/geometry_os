; DESCRIPTION: Composite: Draws a red line from (227, 146) to (175, 222) then Places a white 104x51 rectangle at position (61, 34).
; PLAN: r0=227(x1), r1=146(y1), r2=175(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=34(y), r7=104(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 146
LDI r2, 175
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 34
LDI r7, 104
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
