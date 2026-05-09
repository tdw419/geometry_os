; DESCRIPTION: Draws a cyan line from (506, 127) to (266, 110).
; PLAN: r0=506(x1), r1=127(y1), r2=266(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 127
LDI r2, 266
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
