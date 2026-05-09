; DESCRIPTION: Renders a green line between points (291, 138) and (85, 32).
; PLAN: r0=291(x1), r1=138(y1), r2=85(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 138
LDI r2, 85
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
