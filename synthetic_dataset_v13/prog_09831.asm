; DESCRIPTION: Places a cyan line segment connecting (134, 145) to (479, 36).
; PLAN: r0=134(x1), r1=145(y1), r2=479(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 145
LDI r2, 479
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
