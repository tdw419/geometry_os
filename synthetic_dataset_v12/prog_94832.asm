; DESCRIPTION: Composite: Draws a magenta line from (121, 81) to (317, 122) then Renders a white box of size 60x97 starting at (241, 69).
; PLAN: r0=121(x1), r1=81(y1), r2=317(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=69(y), r7=60(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 81
LDI r2, 317
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 69
LDI r7, 60
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
