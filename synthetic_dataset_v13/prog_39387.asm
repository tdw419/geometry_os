; DESCRIPTION: Renders a magenta line between points (398, 32) and (505, 153).
; PLAN: r0=398(x1), r1=32(y1), r2=505(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 32
LDI r2, 505
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
