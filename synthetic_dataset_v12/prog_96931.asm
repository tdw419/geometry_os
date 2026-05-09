; DESCRIPTION: Places a cyan line segment connecting (86, 63) to (399, 31).
; PLAN: r0=86(x1), r1=63(y1), r2=399(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 63
LDI r2, 399
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
