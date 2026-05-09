; DESCRIPTION: Places a cyan line segment connecting (220, 151) to (231, 184).
; PLAN: r0=220(x1), r1=151(y1), r2=231(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 151
LDI r2, 231
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
