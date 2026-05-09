; DESCRIPTION: Draws a white line from (63, 130) to (80, 184).
; PLAN: r0=63(x1), r1=130(y1), r2=80(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 130
LDI r2, 80
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
