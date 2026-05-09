; DESCRIPTION: Draws a black line from (130, 7) to (215, 96).
; PLAN: r0=130(x1), r1=7(y1), r2=215(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 7
LDI r2, 215
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
