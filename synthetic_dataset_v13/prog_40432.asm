; DESCRIPTION: Composite: Draws a yellow line from (81, 121) to (62, 172) then Places a orange 85x71 rectangle at position (133, 91).
; PLAN: r0=81(x1), r1=121(y1), r2=62(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=91(y), r7=85(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 121
LDI r2, 62
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 91
LDI r7, 85
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
