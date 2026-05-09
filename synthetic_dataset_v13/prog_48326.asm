; DESCRIPTION: Composite: Draws a green line from (281, 181) to (55, 248) then Renders a black box of size 77x113 starting at (234, 82).
; PLAN: r0=281(x1), r1=181(y1), r2=55(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=82(y), r7=77(width), r8=113(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 181
LDI r2, 55
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 82
LDI r7, 77
LDI r8, 113
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
