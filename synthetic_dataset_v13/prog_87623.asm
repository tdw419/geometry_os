; DESCRIPTION: Draws a cyan line from (511, 204) to (96, 136).
; PLAN: r0=511(x1), r1=204(y1), r2=96(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 204
LDI r2, 96
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
