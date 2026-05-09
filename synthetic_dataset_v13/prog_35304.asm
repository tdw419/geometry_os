; DESCRIPTION: Places a white line segment connecting (329, 236) to (174, 157).
; PLAN: r0=329(x1), r1=236(y1), r2=174(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 236
LDI r2, 174
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
