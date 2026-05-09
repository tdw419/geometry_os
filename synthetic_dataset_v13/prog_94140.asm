; DESCRIPTION: Renders a black line between points (429, 73) and (27, 28).
; PLAN: r0=429(x1), r1=73(y1), r2=27(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 73
LDI r2, 27
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
