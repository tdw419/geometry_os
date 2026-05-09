; DESCRIPTION: Composite: Creates a green rectangular region at (389, 52) spanning 67 by 51 pixels then Draws a magenta line from (421, 213) to (238, 27).
; PLAN: r0=389(x), r1=52(y), r2=67(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=213(y1), r7=238(x2), r8=27(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 52
LDI r2, 67
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 213
LDI r7, 238
LDI r8, 27
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
