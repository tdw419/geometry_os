; DESCRIPTION: Renders a white line between points (226, 239) and (18, 63).
; PLAN: r0=226(x1), r1=239(y1), r2=18(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 239
LDI r2, 18
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
