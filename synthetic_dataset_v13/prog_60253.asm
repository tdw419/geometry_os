; DESCRIPTION: Renders a white line between points (498, 237) and (429, 167).
; PLAN: r0=498(x1), r1=237(y1), r2=429(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 237
LDI r2, 429
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
