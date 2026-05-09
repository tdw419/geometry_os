; DESCRIPTION: Draws a cyan line from (345, 66) to (331, 135).
; PLAN: r0=345(x1), r1=66(y1), r2=331(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 66
LDI r2, 331
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
