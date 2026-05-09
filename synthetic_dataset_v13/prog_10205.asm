; DESCRIPTION: Renders a white line between points (429, 82) and (367, 223).
; PLAN: r0=429(x1), r1=82(y1), r2=367(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 82
LDI r2, 367
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
