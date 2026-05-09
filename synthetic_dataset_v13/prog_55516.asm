; DESCRIPTION: Places a white line segment connecting (445, 84) to (217, 236).
; PLAN: r0=445(x1), r1=84(y1), r2=217(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 84
LDI r2, 217
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
