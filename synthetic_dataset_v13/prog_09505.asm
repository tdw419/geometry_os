; DESCRIPTION: Places a yellow line segment connecting (35, 134) to (479, 24).
; PLAN: r0=35(x1), r1=134(y1), r2=479(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 134
LDI r2, 479
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
