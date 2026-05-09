; DESCRIPTION: Renders a green line between points (317, 236) and (506, 39).
; PLAN: r0=317(x1), r1=236(y1), r2=506(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 236
LDI r2, 506
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
