; DESCRIPTION: Draws a cyan line from (0, 74) to (432, 132).
; PLAN: r0=0(x1), r1=74(y1), r2=432(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 74
LDI r2, 432
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
