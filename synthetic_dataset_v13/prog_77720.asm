; DESCRIPTION: Renders a white line between points (125, 27) and (321, 103).
; PLAN: r0=125(x1), r1=27(y1), r2=321(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 27
LDI r2, 321
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
