; DESCRIPTION: Draws a cyan line from (293, 105) to (172, 2).
; PLAN: r0=293(x1), r1=105(y1), r2=172(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 105
LDI r2, 172
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
