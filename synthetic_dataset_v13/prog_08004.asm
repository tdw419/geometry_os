; DESCRIPTION: Composite: Draws a black line from (168, 212) to (248, 218) then Draws a white rectangle at (167, 103) with width 87 and height 47.
; PLAN: r0=168(x1), r1=212(y1), r2=248(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=103(y), r7=87(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 212
LDI r2, 248
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 103
LDI r7, 87
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
