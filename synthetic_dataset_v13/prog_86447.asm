; DESCRIPTION: Draws a cyan line from (22, 4) to (411, 35).
; PLAN: r0=22(x1), r1=4(y1), r2=411(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 4
LDI r2, 411
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
