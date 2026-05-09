; DESCRIPTION: Draws a white line from (329, 112) to (281, 178).
; PLAN: r0=329(x1), r1=112(y1), r2=281(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 112
LDI r2, 281
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
