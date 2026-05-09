; DESCRIPTION: Renders a black line between points (23, 98) and (48, 36).
; PLAN: r0=23(x1), r1=98(y1), r2=48(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 98
LDI r2, 48
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
