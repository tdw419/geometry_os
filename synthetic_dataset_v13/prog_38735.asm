; DESCRIPTION: Composite: Draws a black line from (211, 204) to (55, 66) then Draws a orange rectangle at (60, 56) with width 82 and height 117.
; PLAN: r0=211(x1), r1=204(y1), r2=55(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=56(y), r7=82(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 204
LDI r2, 55
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 56
LDI r7, 82
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
