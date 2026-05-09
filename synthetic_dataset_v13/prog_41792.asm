; DESCRIPTION: Draws a cyan line from (315, 13) to (134, 69).
; PLAN: r0=315(x1), r1=13(y1), r2=134(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 13
LDI r2, 134
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
