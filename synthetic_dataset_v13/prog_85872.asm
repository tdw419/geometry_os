; DESCRIPTION: Composite: Places a blue dot at position (266, 150) then Draws a purple line from (234, 89) to (495, 93) then Renders a white box of size 50x26 starting at (103, 117).
; PLAN: r0=266(x), r1=150(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=234(x1), r6=89(y1), r7=495(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=117(y), r12=50(width), r13=26(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 150
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 89
LDI r7, 495
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 117
LDI r12, 50
LDI r13, 26
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
