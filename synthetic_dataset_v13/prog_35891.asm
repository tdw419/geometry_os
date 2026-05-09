; DESCRIPTION: Draws a orange line from (502, 2) to (406, 10).
; PLAN: r0=502(x1), r1=2(y1), r2=406(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 2
LDI r2, 406
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
