; DESCRIPTION: Renders a white line between points (449, 241) and (39, 76).
; PLAN: r0=449(x1), r1=241(y1), r2=39(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 241
LDI r2, 39
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
