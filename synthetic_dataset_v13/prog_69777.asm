; DESCRIPTION: Draws a cyan line from (424, 234) to (411, 47).
; PLAN: r0=424(x1), r1=234(y1), r2=411(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 234
LDI r2, 411
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
