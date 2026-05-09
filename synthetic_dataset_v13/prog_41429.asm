; DESCRIPTION: Places a white line segment connecting (250, 125) to (281, 8).
; PLAN: r0=250(x1), r1=125(y1), r2=281(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 125
LDI r2, 281
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
