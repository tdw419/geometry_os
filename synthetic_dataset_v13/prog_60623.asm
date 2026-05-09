; DESCRIPTION: Draws a cyan line from (319, 140) to (51, 238).
; PLAN: r0=319(x1), r1=140(y1), r2=51(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 140
LDI r2, 51
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
