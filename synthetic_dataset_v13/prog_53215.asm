; DESCRIPTION: Renders a white line between points (25, 151) and (36, 117).
; PLAN: r0=25(x1), r1=151(y1), r2=36(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 151
LDI r2, 36
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
