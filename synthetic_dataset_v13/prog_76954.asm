; DESCRIPTION: Places a cyan line segment connecting (40, 72) to (483, 27).
; PLAN: r0=40(x1), r1=72(y1), r2=483(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 72
LDI r2, 483
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
