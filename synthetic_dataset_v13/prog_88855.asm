; DESCRIPTION: Draws a cyan line from (53, 119) to (4, 69).
; PLAN: r0=53(x1), r1=119(y1), r2=4(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 119
LDI r2, 4
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
