; DESCRIPTION: Renders a black line between points (46, 125) and (405, 168).
; PLAN: r0=46(x1), r1=125(y1), r2=405(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 125
LDI r2, 405
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
