; DESCRIPTION: Draws a cyan line from (49, 73) to (9, 149).
; PLAN: r0=49(x1), r1=73(y1), r2=9(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 73
LDI r2, 9
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
