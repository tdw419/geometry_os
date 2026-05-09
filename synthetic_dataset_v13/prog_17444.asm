; DESCRIPTION: Renders a white line between points (127, 29) and (454, 150).
; PLAN: r0=127(x1), r1=29(y1), r2=454(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 29
LDI r2, 454
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
