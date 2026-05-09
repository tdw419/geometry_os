; DESCRIPTION: Composite: Renders a orange line between points (467, 132) and (197, 217) then Places a orange 43x77 rectangle at position (356, 26).
; PLAN: r0=467(x1), r1=132(y1), r2=197(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=26(y), r7=43(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 132
LDI r2, 197
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 26
LDI r7, 43
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
