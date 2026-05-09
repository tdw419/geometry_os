; DESCRIPTION: Composite: Draws a white line from (417, 198) to (60, 103) then Renders a purple box of size 105x72 starting at (25, 64).
; PLAN: r0=417(x1), r1=198(y1), r2=60(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=64(y), r7=105(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 198
LDI r2, 60
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 64
LDI r7, 105
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
