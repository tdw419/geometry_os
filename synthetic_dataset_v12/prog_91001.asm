; DESCRIPTION: Renders a white line between points (225, 74) and (276, 56).
; PLAN: r0=225(x1), r1=74(y1), r2=276(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 74
LDI r2, 276
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
