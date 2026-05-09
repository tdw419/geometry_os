; DESCRIPTION: Renders a white line between points (73, 120) and (374, 60).
; PLAN: r0=73(x1), r1=120(y1), r2=374(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 120
LDI r2, 374
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
