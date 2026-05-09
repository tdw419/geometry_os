; DESCRIPTION: Composite: Draws a yellow line from (196, 201) to (6, 105) then Renders a white box of size 42x82 starting at (128, 121).
; PLAN: r0=196(x1), r1=201(y1), r2=6(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=121(y), r7=42(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 201
LDI r2, 6
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 121
LDI r7, 42
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
