; DESCRIPTION: Draws a cyan line from (136, 248) to (34, 84).
; PLAN: r0=136(x1), r1=248(y1), r2=34(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 248
LDI r2, 34
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
