; DESCRIPTION: Places a cyan line segment connecting (169, 195) to (426, 168).
; PLAN: r0=169(x1), r1=195(y1), r2=426(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 195
LDI r2, 426
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
