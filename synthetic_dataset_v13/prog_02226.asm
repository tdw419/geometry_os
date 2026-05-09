; DESCRIPTION: Renders a yellow line between points (144, 185) and (479, 134).
; PLAN: r0=144(x1), r1=185(y1), r2=479(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 185
LDI r2, 479
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
