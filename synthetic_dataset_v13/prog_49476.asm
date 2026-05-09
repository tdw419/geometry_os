; DESCRIPTION: Renders a white line between points (345, 72) and (382, 117).
; PLAN: r0=345(x1), r1=72(y1), r2=382(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 72
LDI r2, 382
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
