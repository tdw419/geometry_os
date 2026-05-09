; DESCRIPTION: Draws a cyan line from (129, 9) to (185, 5).
; PLAN: r0=129(x1), r1=9(y1), r2=185(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 9
LDI r2, 185
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
