; DESCRIPTION: Draws a cyan line from (325, 18) to (349, 134).
; PLAN: r0=325(x1), r1=18(y1), r2=349(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 18
LDI r2, 349
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
