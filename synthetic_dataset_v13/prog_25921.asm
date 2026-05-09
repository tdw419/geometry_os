; DESCRIPTION: Draws a black line from (215, 189) to (188, 225).
; PLAN: r0=215(x1), r1=189(y1), r2=188(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 189
LDI r2, 188
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
