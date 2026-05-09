; DESCRIPTION: Renders a white line between points (173, 61) and (229, 247).
; PLAN: r0=173(x1), r1=61(y1), r2=229(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 61
LDI r2, 229
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
