; DESCRIPTION: Draws a cyan line from (97, 40) to (84, 44).
; PLAN: r0=97(x1), r1=40(y1), r2=84(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 40
LDI r2, 84
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
