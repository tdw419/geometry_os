; DESCRIPTION: Renders a white line between points (495, 247) and (365, 16).
; PLAN: r0=495(x1), r1=247(y1), r2=365(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 247
LDI r2, 365
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
