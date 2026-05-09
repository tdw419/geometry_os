; DESCRIPTION: Renders a green line between points (213, 119) and (479, 83).
; PLAN: r0=213(x1), r1=119(y1), r2=479(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 119
LDI r2, 479
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
