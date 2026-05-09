; DESCRIPTION: Renders a black line between points (275, 50) and (481, 204).
; PLAN: r0=275(x1), r1=50(y1), r2=481(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 50
LDI r2, 481
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
