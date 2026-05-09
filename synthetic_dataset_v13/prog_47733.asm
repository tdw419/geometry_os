; DESCRIPTION: Places a cyan line segment connecting (330, 21) to (31, 177).
; PLAN: r0=330(x1), r1=21(y1), r2=31(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 21
LDI r2, 31
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
