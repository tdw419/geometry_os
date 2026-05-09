; DESCRIPTION: Composite: Draws a red line from (189, 160) to (211, 97) then Renders a purple box of size 32x73 starting at (241, 7).
; PLAN: r0=189(x1), r1=160(y1), r2=211(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=7(y), r7=32(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 160
LDI r2, 211
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 7
LDI r7, 32
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
