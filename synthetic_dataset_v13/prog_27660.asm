; DESCRIPTION: Composite: Places a red line segment connecting (478, 217) to (66, 185) then Places a red 42x81 rectangle at position (298, 61).
; PLAN: r0=478(x1), r1=217(y1), r2=66(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=61(y), r7=42(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 217
LDI r2, 66
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 61
LDI r7, 42
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
