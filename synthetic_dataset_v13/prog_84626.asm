; DESCRIPTION: Draws a cyan line from (203, 6) to (334, 135).
; PLAN: r0=203(x1), r1=6(y1), r2=334(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 6
LDI r2, 334
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
