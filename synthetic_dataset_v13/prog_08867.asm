; DESCRIPTION: Renders a yellow line between points (329, 13) and (126, 57).
; PLAN: r0=329(x1), r1=13(y1), r2=126(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 13
LDI r2, 126
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
