; DESCRIPTION: Renders a white line between points (429, 126) and (254, 112).
; PLAN: r0=429(x1), r1=126(y1), r2=254(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 126
LDI r2, 254
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
