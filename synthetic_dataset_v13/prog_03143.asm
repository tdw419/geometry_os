; DESCRIPTION: Renders a black line between points (68, 126) and (354, 63).
; PLAN: r0=68(x1), r1=126(y1), r2=354(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 126
LDI r2, 354
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
