; DESCRIPTION: Composite: Draws a blue line from (115, 79) to (495, 179) then Renders a black box of size 113x52 starting at (103, 90).
; PLAN: r0=115(x1), r1=79(y1), r2=495(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=90(y), r7=113(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 79
LDI r2, 495
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 90
LDI r7, 113
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
