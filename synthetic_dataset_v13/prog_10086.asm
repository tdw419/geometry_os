; DESCRIPTION: Renders a white line between points (193, 150) and (275, 204).
; PLAN: r0=193(x1), r1=150(y1), r2=275(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 150
LDI r2, 275
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
