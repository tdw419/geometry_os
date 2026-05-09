; DESCRIPTION: Composite: Draws a red line from (38, 235) to (223, 190) then Places a orange 95x18 rectangle at position (281, 43).
; PLAN: r0=38(x1), r1=235(y1), r2=223(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=43(y), r7=95(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 235
LDI r2, 223
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 43
LDI r7, 95
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
