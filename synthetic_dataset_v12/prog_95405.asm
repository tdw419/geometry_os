; DESCRIPTION: Draws a white line from (258, 31) to (365, 117).
; PLAN: r0=258(x1), r1=31(y1), r2=365(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 31
LDI r2, 365
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
