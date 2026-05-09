; DESCRIPTION: Draws a orange line from (48, 62) to (386, 48).
; PLAN: r0=48(x1), r1=62(y1), r2=386(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 62
LDI r2, 386
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
