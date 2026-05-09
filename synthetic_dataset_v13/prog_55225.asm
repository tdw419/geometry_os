; DESCRIPTION: Renders a green line between points (263, 216) and (144, 57).
; PLAN: r0=263(x1), r1=216(y1), r2=144(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 216
LDI r2, 144
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
