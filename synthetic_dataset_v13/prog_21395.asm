; DESCRIPTION: Places a cyan line segment connecting (194, 72) to (247, 86).
; PLAN: r0=194(x1), r1=72(y1), r2=247(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 72
LDI r2, 247
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
