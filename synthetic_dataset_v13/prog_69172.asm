; DESCRIPTION: Renders a green line between points (475, 249) and (52, 57).
; PLAN: r0=475(x1), r1=249(y1), r2=52(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 249
LDI r2, 52
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
