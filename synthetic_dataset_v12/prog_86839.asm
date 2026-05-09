; DESCRIPTION: Composite: Renders a blue box of size 92x114 starting at (265, 114) then Renders a blue line between points (103, 143) and (52, 78).
; PLAN: r0=265(x), r1=114(y), r2=92(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=143(y1), r7=52(x2), r8=78(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 114
LDI r2, 92
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 143
LDI r7, 52
LDI r8, 78
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
