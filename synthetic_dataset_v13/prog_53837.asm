; DESCRIPTION: Composite: Places a purple 36x87 rectangle at position (247, 19) then Draws a white line from (456, 225) to (18, 78).
; PLAN: r0=247(x), r1=19(y), r2=36(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x1), r6=225(y1), r7=18(x2), r8=78(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 19
LDI r2, 36
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 225
LDI r7, 18
LDI r8, 78
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
