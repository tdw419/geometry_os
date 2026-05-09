; DESCRIPTION: Renders a black line between points (140, 54) and (231, 166).
; PLAN: r0=140(x1), r1=54(y1), r2=231(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 54
LDI r2, 231
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
