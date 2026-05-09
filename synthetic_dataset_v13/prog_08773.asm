; DESCRIPTION: Renders a green line between points (238, 51) and (382, 39).
; PLAN: r0=238(x1), r1=51(y1), r2=382(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 51
LDI r2, 382
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
