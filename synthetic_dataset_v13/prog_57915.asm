; DESCRIPTION: Draws a cyan line from (423, 138) to (53, 17).
; PLAN: r0=423(x1), r1=138(y1), r2=53(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 138
LDI r2, 53
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
