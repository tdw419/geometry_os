; DESCRIPTION: Places a white line segment connecting (358, 111) to (263, 87).
; PLAN: r0=358(x1), r1=111(y1), r2=263(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 111
LDI r2, 263
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
