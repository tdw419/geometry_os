; DESCRIPTION: Places a cyan line segment connecting (84, 118) to (307, 177).
; PLAN: r0=84(x1), r1=118(y1), r2=307(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 118
LDI r2, 307
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
