; DESCRIPTION: Draws a cyan line from (331, 7) to (423, 83).
; PLAN: r0=331(x1), r1=7(y1), r2=423(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 7
LDI r2, 423
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
