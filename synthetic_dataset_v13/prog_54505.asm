; DESCRIPTION: Renders a yellow line between points (475, 77) and (479, 237).
; PLAN: r0=475(x1), r1=77(y1), r2=479(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 77
LDI r2, 479
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
