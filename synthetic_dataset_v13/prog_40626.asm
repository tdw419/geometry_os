; DESCRIPTION: Places a magenta line segment connecting (146, 209) to (238, 22).
; PLAN: r0=146(x1), r1=209(y1), r2=238(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 209
LDI r2, 238
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
