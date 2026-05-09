; DESCRIPTION: Composite: Renders a yellow box of size 77x62 starting at (62, 175) then Draws a orange line from (60, 47) to (57, 202).
; PLAN: r0=62(x), r1=175(y), r2=77(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x1), r6=47(y1), r7=57(x2), r8=202(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 175
LDI r2, 77
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 47
LDI r7, 57
LDI r8, 202
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
