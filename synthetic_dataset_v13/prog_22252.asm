; DESCRIPTION: Places a red line segment connecting (279, 209) to (56, 226).
; PLAN: r0=279(x1), r1=209(y1), r2=56(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 209
LDI r2, 56
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
