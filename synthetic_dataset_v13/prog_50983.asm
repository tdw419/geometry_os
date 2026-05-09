; DESCRIPTION: Renders a black line between points (71, 64) and (54, 32).
; PLAN: r0=71(x1), r1=64(y1), r2=54(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 64
LDI r2, 54
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
