; DESCRIPTION: Places a white line segment connecting (502, 134) to (365, 203).
; PLAN: r0=502(x1), r1=134(y1), r2=365(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 134
LDI r2, 365
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
