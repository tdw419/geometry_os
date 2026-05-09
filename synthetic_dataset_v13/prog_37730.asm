; DESCRIPTION: Draws a cyan line from (115, 131) to (200, 155).
; PLAN: r0=115(x1), r1=131(y1), r2=200(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 131
LDI r2, 200
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
