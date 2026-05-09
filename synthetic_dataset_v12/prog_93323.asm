; DESCRIPTION: Renders a white line between points (48, 245) and (84, 5).
; PLAN: r0=48(x1), r1=245(y1), r2=84(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 245
LDI r2, 84
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
