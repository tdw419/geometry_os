; DESCRIPTION: Renders a white line between points (439, 125) and (210, 173).
; PLAN: r0=439(x1), r1=125(y1), r2=210(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 125
LDI r2, 210
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
