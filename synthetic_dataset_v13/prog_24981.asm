; DESCRIPTION: Renders a black line between points (239, 77) and (262, 45).
; PLAN: r0=239(x1), r1=77(y1), r2=262(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 77
LDI r2, 262
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
