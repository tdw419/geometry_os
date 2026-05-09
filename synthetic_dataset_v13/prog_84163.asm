; DESCRIPTION: Composite: Draws a black line from (282, 52) to (329, 60) then Places a orange 68x62 rectangle at position (135, 9).
; PLAN: r0=282(x1), r1=52(y1), r2=329(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=9(y), r7=68(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 52
LDI r2, 329
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 9
LDI r7, 68
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
