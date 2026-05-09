; DESCRIPTION: Renders a black line between points (330, 168) and (449, 34).
; PLAN: r0=330(x1), r1=168(y1), r2=449(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 168
LDI r2, 449
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
