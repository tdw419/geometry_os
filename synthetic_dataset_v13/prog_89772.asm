; DESCRIPTION: Draws a yellow line from (77, 247) to (431, 86).
; PLAN: r0=77(x1), r1=247(y1), r2=431(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 247
LDI r2, 431
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
