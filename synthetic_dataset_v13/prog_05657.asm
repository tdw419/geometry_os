; DESCRIPTION: Draws a cyan line from (444, 83) to (161, 251).
; PLAN: r0=444(x1), r1=83(y1), r2=161(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 83
LDI r2, 161
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
