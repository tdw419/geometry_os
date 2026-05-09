; DESCRIPTION: Places a cyan line segment connecting (345, 235) to (307, 138).
; PLAN: r0=345(x1), r1=235(y1), r2=307(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 235
LDI r2, 307
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
