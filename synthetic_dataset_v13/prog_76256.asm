; DESCRIPTION: Renders a cyan line between points (241, 142) and (276, 100).
; PLAN: r0=241(x1), r1=142(y1), r2=276(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 142
LDI r2, 276
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
