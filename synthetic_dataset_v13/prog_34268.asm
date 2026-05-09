; DESCRIPTION: Renders a white line between points (280, 245) and (408, 200).
; PLAN: r0=280(x1), r1=245(y1), r2=408(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 245
LDI r2, 408
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
