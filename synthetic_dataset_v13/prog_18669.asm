; DESCRIPTION: Renders a white line between points (196, 87) and (373, 243).
; PLAN: r0=196(x1), r1=87(y1), r2=373(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 87
LDI r2, 373
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
