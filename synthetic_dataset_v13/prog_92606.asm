; DESCRIPTION: Places a black line segment connecting (98, 111) to (415, 196).
; PLAN: r0=98(x1), r1=111(y1), r2=415(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 111
LDI r2, 415
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
