; DESCRIPTION: Composite: Places a blue 55x13 rectangle at position (365, 6) then Renders a white line between points (61, 175) and (456, 97).
; PLAN: r0=365(x), r1=6(y), r2=55(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x1), r6=175(y1), r7=456(x2), r8=97(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 6
LDI r2, 55
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 175
LDI r7, 456
LDI r8, 97
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
