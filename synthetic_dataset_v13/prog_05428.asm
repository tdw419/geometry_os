; DESCRIPTION: Draws a cyan line from (125, 238) to (136, 188).
; PLAN: r0=125(x1), r1=238(y1), r2=136(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 238
LDI r2, 136
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
