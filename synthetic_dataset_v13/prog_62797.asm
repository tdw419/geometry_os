; DESCRIPTION: Renders a yellow line between points (462, 115) and (479, 204).
; PLAN: r0=462(x1), r1=115(y1), r2=479(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 115
LDI r2, 479
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
