; DESCRIPTION: Draws a cyan line from (423, 40) to (506, 78).
; PLAN: r0=423(x1), r1=40(y1), r2=506(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 40
LDI r2, 506
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
