; DESCRIPTION: Renders a white line between points (480, 23) and (66, 120).
; PLAN: r0=480(x1), r1=23(y1), r2=66(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 23
LDI r2, 66
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
