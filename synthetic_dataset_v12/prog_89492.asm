; DESCRIPTION: Renders a white line between points (329, 20) and (151, 3).
; PLAN: r0=329(x1), r1=20(y1), r2=151(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 20
LDI r2, 151
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
