; DESCRIPTION: Places a cyan line segment connecting (85, 27) to (195, 216).
; PLAN: r0=85(x1), r1=27(y1), r2=195(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 27
LDI r2, 195
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
