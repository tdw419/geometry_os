; DESCRIPTION: Renders a white line between points (240, 63) and (279, 214).
; PLAN: r0=240(x1), r1=63(y1), r2=279(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 63
LDI r2, 279
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
