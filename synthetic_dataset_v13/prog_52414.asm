; DESCRIPTION: Renders a green line between points (446, 33) and (109, 220).
; PLAN: r0=446(x1), r1=33(y1), r2=109(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 33
LDI r2, 109
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
