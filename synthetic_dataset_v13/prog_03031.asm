; DESCRIPTION: Renders a green line between points (475, 119) and (214, 27).
; PLAN: r0=475(x1), r1=119(y1), r2=214(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 119
LDI r2, 214
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
