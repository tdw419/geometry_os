; DESCRIPTION: Renders a green line between points (479, 81) and (140, 30).
; PLAN: r0=479(x1), r1=81(y1), r2=140(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 81
LDI r2, 140
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
