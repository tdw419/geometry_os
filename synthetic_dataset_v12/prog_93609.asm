; DESCRIPTION: Renders a black line between points (366, 140) and (346, 196).
; PLAN: r0=366(x1), r1=140(y1), r2=346(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 140
LDI r2, 346
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
