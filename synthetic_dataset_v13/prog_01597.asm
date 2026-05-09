; DESCRIPTION: Draws a black line from (215, 40) to (241, 120).
; PLAN: r0=215(x1), r1=40(y1), r2=241(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 40
LDI r2, 241
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
