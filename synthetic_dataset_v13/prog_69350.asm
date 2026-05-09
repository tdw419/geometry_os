; DESCRIPTION: Places a green line segment connecting (231, 59) to (479, 125).
; PLAN: r0=231(x1), r1=59(y1), r2=479(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 59
LDI r2, 479
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
