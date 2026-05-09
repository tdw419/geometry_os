; DESCRIPTION: Draws a green line from (98, 21) to (389, 134).
; PLAN: r0=98(x1), r1=21(y1), r2=389(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 21
LDI r2, 389
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
