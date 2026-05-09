; DESCRIPTION: Draws a cyan line from (466, 18) to (501, 188).
; PLAN: r0=466(x1), r1=18(y1), r2=501(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 18
LDI r2, 501
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
