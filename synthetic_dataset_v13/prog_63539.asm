; DESCRIPTION: Draws a cyan line from (98, 110) to (426, 69).
; PLAN: r0=98(x1), r1=110(y1), r2=426(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 110
LDI r2, 426
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
