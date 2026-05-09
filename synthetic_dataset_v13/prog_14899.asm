; DESCRIPTION: Draws a cyan line from (349, 26) to (10, 58).
; PLAN: r0=349(x1), r1=26(y1), r2=10(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 26
LDI r2, 10
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
