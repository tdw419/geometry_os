; DESCRIPTION: Renders a black line between points (446, 62) and (56, 37).
; PLAN: r0=446(x1), r1=62(y1), r2=56(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 62
LDI r2, 56
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
