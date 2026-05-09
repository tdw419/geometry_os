; DESCRIPTION: Renders a green line between points (60, 193) and (479, 5).
; PLAN: r0=60(x1), r1=193(y1), r2=479(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 193
LDI r2, 479
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
