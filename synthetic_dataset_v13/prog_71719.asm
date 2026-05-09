; DESCRIPTION: Renders a blue line between points (23, 240) and (354, 235).
; PLAN: r0=23(x1), r1=240(y1), r2=354(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 240
LDI r2, 354
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
