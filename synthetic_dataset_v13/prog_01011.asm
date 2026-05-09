; DESCRIPTION: Draws a cyan line from (223, 238) to (341, 22).
; PLAN: r0=223(x1), r1=238(y1), r2=341(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 238
LDI r2, 341
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
