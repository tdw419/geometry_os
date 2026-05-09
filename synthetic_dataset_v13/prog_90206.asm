; DESCRIPTION: Places a white line segment connecting (350, 157) to (166, 231).
; PLAN: r0=350(x1), r1=157(y1), r2=166(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 157
LDI r2, 166
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
