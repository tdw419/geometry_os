; DESCRIPTION: Renders a white line between points (319, 126) and (449, 100).
; PLAN: r0=319(x1), r1=126(y1), r2=449(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 126
LDI r2, 449
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
