; DESCRIPTION: Draws a cyan line from (119, 68) to (123, 79).
; PLAN: r0=119(x1), r1=68(y1), r2=123(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 68
LDI r2, 123
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
