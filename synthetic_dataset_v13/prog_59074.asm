; DESCRIPTION: Renders a green line between points (332, 101) and (479, 107).
; PLAN: r0=332(x1), r1=101(y1), r2=479(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 101
LDI r2, 479
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
