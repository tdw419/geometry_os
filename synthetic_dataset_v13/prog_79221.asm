; DESCRIPTION: Composite: Places a white 85x81 rectangle at position (54, 73) then Draws a green line from (289, 172) to (417, 148).
; PLAN: r0=54(x), r1=73(y), r2=85(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x1), r6=172(y1), r7=417(x2), r8=148(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 73
LDI r2, 85
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 172
LDI r7, 417
LDI r8, 148
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
