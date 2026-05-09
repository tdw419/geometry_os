; DESCRIPTION: Composite: Draws a black line from (167, 187) to (437, 101) then Places a red 26x26 rectangle at position (74, 209).
; PLAN: r0=167(x1), r1=187(y1), r2=437(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=209(y), r7=26(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 187
LDI r2, 437
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 209
LDI r7, 26
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
