; DESCRIPTION: Renders a green line between points (97, 213) and (504, 227).
; PLAN: r0=97(x1), r1=213(y1), r2=504(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 213
LDI r2, 504
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
