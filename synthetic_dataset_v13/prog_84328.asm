; DESCRIPTION: Renders a black line between points (445, 98) and (421, 126).
; PLAN: r0=445(x1), r1=98(y1), r2=421(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 98
LDI r2, 421
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
