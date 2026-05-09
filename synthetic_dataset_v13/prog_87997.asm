; DESCRIPTION: Composite: Places a black circle of radius 71 at center (99, 145) then Draws a orange line from (420, 118) to (67, 246).
; PLAN: r0=99(x), r1=145(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x1), r6=118(y1), r7=67(x2), r8=246(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 145
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 118
LDI r7, 67
LDI r8, 246
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
