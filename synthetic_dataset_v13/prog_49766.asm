; DESCRIPTION: Composite: Places a magenta 60x41 rectangle at position (346, 43) then Draws a purple line from (79, 130) to (199, 134).
; PLAN: r0=346(x), r1=43(y), r2=60(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=130(y1), r7=199(x2), r8=134(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 43
LDI r2, 60
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 130
LDI r7, 199
LDI r8, 134
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
