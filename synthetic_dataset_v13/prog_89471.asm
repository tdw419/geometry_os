; DESCRIPTION: Draws a cyan line from (106, 58) to (123, 94).
; PLAN: r0=106(x1), r1=58(y1), r2=123(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 58
LDI r2, 123
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
