; DESCRIPTION: Composite: Places a blue 119x57 rectangle at position (203, 7) then Places a white line segment connecting (26, 146) to (96, 137).
; PLAN: r0=203(x), r1=7(y), r2=119(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x1), r6=146(y1), r7=96(x2), r8=137(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 7
LDI r2, 119
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 146
LDI r7, 96
LDI r8, 137
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
