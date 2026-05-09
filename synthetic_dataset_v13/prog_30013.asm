; DESCRIPTION: Places a magenta line segment connecting (170, 73) to (168, 235).
; PLAN: r0=170(x1), r1=73(y1), r2=168(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 73
LDI r2, 168
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
