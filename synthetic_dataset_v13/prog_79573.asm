; DESCRIPTION: Draws a white line from (203, 231) to (174, 245).
; PLAN: r0=203(x1), r1=231(y1), r2=174(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 231
LDI r2, 174
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
