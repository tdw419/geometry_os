; DESCRIPTION: Draws a cyan line from (310, 84) to (357, 180).
; PLAN: r0=310(x1), r1=84(y1), r2=357(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 84
LDI r2, 357
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
