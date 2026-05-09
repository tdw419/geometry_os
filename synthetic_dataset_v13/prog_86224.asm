; DESCRIPTION: Draws a green line from (309, 215) to (130, 238).
; PLAN: r0=309(x1), r1=215(y1), r2=130(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 215
LDI r2, 130
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
