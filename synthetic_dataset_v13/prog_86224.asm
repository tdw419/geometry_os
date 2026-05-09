; DESCRIPTION: Draws a black line from (118, 223) to (215, 236).
; PLAN: r0=118(x1), r1=223(y1), r2=215(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 223
LDI r2, 215
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
