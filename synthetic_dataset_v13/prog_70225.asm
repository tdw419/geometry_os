; DESCRIPTION: Draws a cyan line from (33, 89) to (0, 163).
; PLAN: r0=33(x1), r1=89(y1), r2=0(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 89
LDI r2, 0
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
