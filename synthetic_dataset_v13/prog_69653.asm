; DESCRIPTION: Renders a green line between points (349, 126) and (260, 37).
; PLAN: r0=349(x1), r1=126(y1), r2=260(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 126
LDI r2, 260
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
