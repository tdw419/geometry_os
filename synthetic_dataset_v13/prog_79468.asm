; DESCRIPTION: Renders a black line between points (109, 59) and (354, 196).
; PLAN: r0=109(x1), r1=59(y1), r2=354(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 59
LDI r2, 354
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
