; DESCRIPTION: Draws a cyan line from (432, 164) to (426, 77).
; PLAN: r0=432(x1), r1=164(y1), r2=426(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 164
LDI r2, 426
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
