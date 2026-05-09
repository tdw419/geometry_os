; DESCRIPTION: Composite: Draws a green line from (246, 17) to (87, 97) then Renders a green box of size 42x107 starting at (293, 74).
; PLAN: r0=246(x1), r1=17(y1), r2=87(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=74(y), r7=42(width), r8=107(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 17
LDI r2, 87
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 74
LDI r7, 42
LDI r8, 107
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
