; DESCRIPTION: Renders a black line between points (218, 96) and (280, 237).
; PLAN: r0=218(x1), r1=96(y1), r2=280(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 96
LDI r2, 280
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
