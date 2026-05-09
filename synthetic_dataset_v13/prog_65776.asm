; DESCRIPTION: Renders a white line between points (382, 32) and (392, 52).
; PLAN: r0=382(x1), r1=32(y1), r2=392(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 32
LDI r2, 392
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
