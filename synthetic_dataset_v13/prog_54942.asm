; DESCRIPTION: Draws a cyan line from (388, 80) to (145, 47).
; PLAN: r0=388(x1), r1=80(y1), r2=145(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 80
LDI r2, 145
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
