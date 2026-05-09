; DESCRIPTION: Renders a green line between points (292, 172) and (210, 39).
; PLAN: r0=292(x1), r1=172(y1), r2=210(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 172
LDI r2, 210
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
