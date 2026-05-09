; DESCRIPTION: Renders a white line between points (429, 32) and (278, 16).
; PLAN: r0=429(x1), r1=32(y1), r2=278(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 32
LDI r2, 278
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
