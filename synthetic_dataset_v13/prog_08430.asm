; DESCRIPTION: Renders a black line between points (277, 2) and (262, 37).
; PLAN: r0=277(x1), r1=2(y1), r2=262(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 2
LDI r2, 262
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
