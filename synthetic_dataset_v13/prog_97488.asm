; DESCRIPTION: Renders a white line between points (178, 98) and (214, 63).
; PLAN: r0=178(x1), r1=98(y1), r2=214(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 98
LDI r2, 214
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
