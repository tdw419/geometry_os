; DESCRIPTION: Draws a red line from (220, 250) to (265, 238).
; PLAN: r0=220(x1), r1=250(y1), r2=265(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 250
LDI r2, 265
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
