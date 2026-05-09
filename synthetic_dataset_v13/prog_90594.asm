; DESCRIPTION: Renders a green line between points (473, 19) and (483, 42).
; PLAN: r0=473(x1), r1=19(y1), r2=483(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 19
LDI r2, 483
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
