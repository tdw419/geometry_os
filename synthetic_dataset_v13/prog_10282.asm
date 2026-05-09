; DESCRIPTION: Draws a cyan line from (503, 217) to (236, 84).
; PLAN: r0=503(x1), r1=217(y1), r2=236(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 217
LDI r2, 236
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
