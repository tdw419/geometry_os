; DESCRIPTION: Places a cyan line segment connecting (252, 56) to (45, 177).
; PLAN: r0=252(x1), r1=56(y1), r2=45(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 56
LDI r2, 45
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
