; DESCRIPTION: Draws a cyan line from (431, 95) to (312, 110).
; PLAN: r0=431(x1), r1=95(y1), r2=312(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 95
LDI r2, 312
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
