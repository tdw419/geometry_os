; DESCRIPTION: Places a white line segment connecting (262, 237) to (265, 63).
; PLAN: r0=262(x1), r1=237(y1), r2=265(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 237
LDI r2, 265
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
