; DESCRIPTION: Renders a black line between points (258, 213) and (98, 238).
; PLAN: r0=258(x1), r1=213(y1), r2=98(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 213
LDI r2, 98
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
