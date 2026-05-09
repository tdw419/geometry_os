; DESCRIPTION: Renders a orange line between points (91, 38) and (307, 117).
; PLAN: r0=91(x1), r1=38(y1), r2=307(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 38
LDI r2, 307
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
