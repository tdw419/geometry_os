; DESCRIPTION: Draws a cyan line from (431, 80) to (129, 18).
; PLAN: r0=431(x1), r1=80(y1), r2=129(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 80
LDI r2, 129
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
