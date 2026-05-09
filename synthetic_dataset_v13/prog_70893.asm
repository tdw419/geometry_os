; DESCRIPTION: Composite: Renders a red line between points (342, 159) and (483, 21) then Places a white 105x117 rectangle at position (325, 8).
; PLAN: r0=342(x1), r1=159(y1), r2=483(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=8(y), r7=105(width), r8=117(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 159
LDI r2, 483
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 8
LDI r7, 105
LDI r8, 117
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
