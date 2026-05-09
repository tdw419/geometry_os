; DESCRIPTION: Places a cyan line segment connecting (263, 127) to (343, 170).
; PLAN: r0=263(x1), r1=127(y1), r2=343(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 127
LDI r2, 343
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
