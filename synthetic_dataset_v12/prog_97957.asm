; DESCRIPTION: Places a magenta line segment connecting (225, 177) to (173, 151).
; PLAN: r0=225(x1), r1=177(y1), r2=173(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 177
LDI r2, 173
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
