; DESCRIPTION: Renders a white line between points (87, 24) and (384, 64).
; PLAN: r0=87(x1), r1=24(y1), r2=384(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 24
LDI r2, 384
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
