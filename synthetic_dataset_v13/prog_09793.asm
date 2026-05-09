; DESCRIPTION: Places a cyan line segment connecting (164, 71) to (131, 87).
; PLAN: r0=164(x1), r1=71(y1), r2=131(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 71
LDI r2, 131
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
