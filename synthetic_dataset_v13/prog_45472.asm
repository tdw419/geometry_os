; DESCRIPTION: Renders a green line between points (382, 236) and (266, 226).
; PLAN: r0=382(x1), r1=236(y1), r2=266(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 236
LDI r2, 266
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
