; DESCRIPTION: Places a cyan line segment connecting (473, 151) to (466, 63).
; PLAN: r0=473(x1), r1=151(y1), r2=466(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 151
LDI r2, 466
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
