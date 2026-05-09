; DESCRIPTION: Renders a green line between points (126, 133) and (279, 0).
; PLAN: r0=126(x1), r1=133(y1), r2=279(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 133
LDI r2, 279
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
