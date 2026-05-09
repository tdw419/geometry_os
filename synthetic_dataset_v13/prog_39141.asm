; DESCRIPTION: Renders a black line between points (28, 152) and (437, 120).
; PLAN: r0=28(x1), r1=152(y1), r2=437(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 152
LDI r2, 437
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
