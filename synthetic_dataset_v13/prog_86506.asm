; DESCRIPTION: Places a white line segment connecting (120, 237) to (164, 236).
; PLAN: r0=120(x1), r1=237(y1), r2=164(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 237
LDI r2, 164
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
