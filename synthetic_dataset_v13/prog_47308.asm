; DESCRIPTION: Renders a yellow line between points (196, 45) and (317, 21).
; PLAN: r0=196(x1), r1=45(y1), r2=317(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 45
LDI r2, 317
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
