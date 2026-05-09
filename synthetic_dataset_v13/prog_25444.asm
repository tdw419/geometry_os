; DESCRIPTION: Renders a white line between points (465, 148) and (10, 200).
; PLAN: r0=465(x1), r1=148(y1), r2=10(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 148
LDI r2, 10
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
