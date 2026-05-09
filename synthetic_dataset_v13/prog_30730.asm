; DESCRIPTION: Draws a cyan line from (288, 110) to (369, 61).
; PLAN: r0=288(x1), r1=110(y1), r2=369(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 110
LDI r2, 369
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
