; DESCRIPTION: Places a cyan line segment connecting (479, 229) to (377, 81).
; PLAN: r0=479(x1), r1=229(y1), r2=377(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 229
LDI r2, 377
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
