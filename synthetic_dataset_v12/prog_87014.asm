; DESCRIPTION: Renders a white line between points (420, 6) and (66, 63).
; PLAN: r0=420(x1), r1=6(y1), r2=66(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 6
LDI r2, 66
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
