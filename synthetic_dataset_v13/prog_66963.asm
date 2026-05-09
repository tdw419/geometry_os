; DESCRIPTION: Draws a cyan line from (160, 218) to (151, 77).
; PLAN: r0=160(x1), r1=218(y1), r2=151(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 218
LDI r2, 151
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
