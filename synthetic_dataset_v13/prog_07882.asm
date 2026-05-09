; DESCRIPTION: Renders a white line between points (63, 112) and (239, 54).
; PLAN: r0=63(x1), r1=112(y1), r2=239(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 112
LDI r2, 239
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
