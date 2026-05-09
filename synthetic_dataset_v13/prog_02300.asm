; DESCRIPTION: Composite: Draws a green line from (191, 10) to (266, 76) then Draws a black rectangle at (42, 20) with width 46 and height 99.
; PLAN: r0=191(x1), r1=10(y1), r2=266(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=20(y), r7=46(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 10
LDI r2, 266
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 20
LDI r7, 46
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
