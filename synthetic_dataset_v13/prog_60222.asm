; DESCRIPTION: Renders a orange line between points (196, 1) and (386, 206).
; PLAN: r0=196(x1), r1=1(y1), r2=386(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 1
LDI r2, 386
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
