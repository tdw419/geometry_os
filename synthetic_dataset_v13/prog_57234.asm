; DESCRIPTION: Draws a white line from (445, 234) to (331, 63).
; PLAN: r0=445(x1), r1=234(y1), r2=331(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 234
LDI r2, 331
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
