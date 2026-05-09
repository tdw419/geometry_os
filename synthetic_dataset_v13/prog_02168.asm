; DESCRIPTION: Places a white line segment connecting (477, 209) to (164, 28).
; PLAN: r0=477(x1), r1=209(y1), r2=164(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 209
LDI r2, 164
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
