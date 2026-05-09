; DESCRIPTION: Composite: Draws a cyan line from (181, 232) to (72, 52) then Renders a green box of size 11x87 starting at (194, 92).
; PLAN: r0=181(x1), r1=232(y1), r2=72(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=92(y), r7=11(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 232
LDI r2, 72
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 92
LDI r7, 11
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
