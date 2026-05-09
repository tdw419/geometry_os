; DESCRIPTION: Renders a white line between points (426, 80) and (19, 166).
; PLAN: r0=426(x1), r1=80(y1), r2=19(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 80
LDI r2, 19
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
