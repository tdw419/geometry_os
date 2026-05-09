; DESCRIPTION: Composite: Draws a orange line from (370, 188) to (296, 66) then Places a white 73x56 rectangle at position (266, 102).
; PLAN: r0=370(x1), r1=188(y1), r2=296(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=102(y), r7=73(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 188
LDI r2, 296
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 102
LDI r7, 73
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
