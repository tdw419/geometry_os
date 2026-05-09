; DESCRIPTION: Renders a magenta line between points (371, 240) and (475, 5).
; PLAN: r0=371(x1), r1=240(y1), r2=475(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 240
LDI r2, 475
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
