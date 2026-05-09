; DESCRIPTION: Places a cyan line segment connecting (151, 229) to (473, 37).
; PLAN: r0=151(x1), r1=229(y1), r2=473(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 229
LDI r2, 473
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
