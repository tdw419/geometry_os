; DESCRIPTION: Draws a cyan line from (313, 218) to (15, 121).
; PLAN: r0=313(x1), r1=218(y1), r2=15(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 218
LDI r2, 15
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
