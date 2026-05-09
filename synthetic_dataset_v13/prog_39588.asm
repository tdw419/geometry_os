; DESCRIPTION: Places a cyan line segment connecting (505, 177) to (52, 6).
; PLAN: r0=505(x1), r1=177(y1), r2=52(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 177
LDI r2, 52
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
