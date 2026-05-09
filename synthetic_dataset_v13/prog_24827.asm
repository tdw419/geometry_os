; DESCRIPTION: Draws a cyan line from (145, 74) to (511, 196).
; PLAN: r0=145(x1), r1=74(y1), r2=511(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 74
LDI r2, 511
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
