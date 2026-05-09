; DESCRIPTION: Renders a black line between points (23, 114) and (64, 174).
; PLAN: r0=23(x1), r1=114(y1), r2=64(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 114
LDI r2, 64
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
