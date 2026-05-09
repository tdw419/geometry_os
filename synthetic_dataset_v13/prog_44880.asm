; DESCRIPTION: Renders a orange line between points (307, 22) and (58, 166).
; PLAN: r0=307(x1), r1=22(y1), r2=58(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 22
LDI r2, 58
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
