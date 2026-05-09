; DESCRIPTION: Renders a white line between points (221, 20) and (466, 173).
; PLAN: r0=221(x1), r1=20(y1), r2=466(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 20
LDI r2, 466
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
