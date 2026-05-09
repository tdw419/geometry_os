; DESCRIPTION: Composite: Draws a magenta line from (72, 21) to (93, 175) then Renders a black box of size 92x23 starting at (265, 19).
; PLAN: r0=72(x1), r1=21(y1), r2=93(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=19(y), r7=92(width), r8=23(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 21
LDI r2, 93
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 19
LDI r7, 92
LDI r8, 23
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
