; DESCRIPTION: Draws a cyan line from (55, 83) to (218, 194).
; PLAN: r0=55(x1), r1=83(y1), r2=218(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 83
LDI r2, 218
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
