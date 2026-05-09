; DESCRIPTION: Draws a cyan line from (501, 222) to (77, 18).
; PLAN: r0=501(x1), r1=222(y1), r2=77(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 222
LDI r2, 77
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
