; DESCRIPTION: Places a white line segment connecting (358, 168) to (477, 236).
; PLAN: r0=358(x1), r1=168(y1), r2=477(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 168
LDI r2, 477
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
