; DESCRIPTION: Renders a green line between points (479, 207) and (212, 145).
; PLAN: r0=479(x1), r1=207(y1), r2=212(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 207
LDI r2, 212
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
