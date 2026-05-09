; DESCRIPTION: Composite: Draws a purple line from (254, 42) to (286, 24) then Places a blue 78x85 rectangle at position (369, 135).
; PLAN: r0=254(x1), r1=42(y1), r2=286(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=135(y), r7=78(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 42
LDI r2, 286
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 135
LDI r7, 78
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
