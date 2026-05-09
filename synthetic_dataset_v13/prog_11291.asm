; DESCRIPTION: Renders a green line between points (355, 111) and (291, 220).
; PLAN: r0=355(x1), r1=111(y1), r2=291(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 111
LDI r2, 291
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
