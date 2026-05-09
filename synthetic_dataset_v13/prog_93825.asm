; DESCRIPTION: Draws a orange line from (386, 121) to (124, 246).
; PLAN: r0=386(x1), r1=121(y1), r2=124(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 121
LDI r2, 124
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
