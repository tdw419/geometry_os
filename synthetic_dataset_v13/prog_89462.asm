; DESCRIPTION: Draws a cyan line from (123, 174) to (89, 47).
; PLAN: r0=123(x1), r1=174(y1), r2=89(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 174
LDI r2, 89
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
