; DESCRIPTION: Composite: Places a cyan 119x89 rectangle at position (47, 72) then Draws a red line from (117, 112) to (260, 102).
; PLAN: r0=47(x), r1=72(y), r2=119(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=112(y1), r7=260(x2), r8=102(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 72
LDI r2, 119
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 112
LDI r7, 260
LDI r8, 102
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
