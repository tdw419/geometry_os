; DESCRIPTION: Draws a white line from (174, 26) to (83, 213).
; PLAN: r0=174(x1), r1=26(y1), r2=83(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 26
LDI r2, 83
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
