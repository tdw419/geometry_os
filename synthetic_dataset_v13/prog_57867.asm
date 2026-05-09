; DESCRIPTION: Draws a cyan line from (94, 20) to (51, 163).
; PLAN: r0=94(x1), r1=20(y1), r2=51(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 20
LDI r2, 51
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
