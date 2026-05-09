; DESCRIPTION: Renders a white line between points (32, 210) and (484, 143).
; PLAN: r0=32(x1), r1=210(y1), r2=484(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 210
LDI r2, 484
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
