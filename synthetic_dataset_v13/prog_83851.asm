; DESCRIPTION: Places a green line segment connecting (479, 178) to (322, 102).
; PLAN: r0=479(x1), r1=178(y1), r2=322(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 178
LDI r2, 322
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
