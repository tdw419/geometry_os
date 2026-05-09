; DESCRIPTION: Draws a cyan line from (478, 114) to (4, 72).
; PLAN: r0=478(x1), r1=114(y1), r2=4(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 114
LDI r2, 4
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
