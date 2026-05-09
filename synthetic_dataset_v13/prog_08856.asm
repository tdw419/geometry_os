; DESCRIPTION: Draws a yellow line from (157, 134) to (365, 225).
; PLAN: r0=157(x1), r1=134(y1), r2=365(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 134
LDI r2, 365
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
