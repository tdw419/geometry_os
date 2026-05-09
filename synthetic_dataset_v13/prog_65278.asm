; DESCRIPTION: Draws a white line from (228, 11) to (211, 207).
; PLAN: r0=228(x1), r1=11(y1), r2=211(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 11
LDI r2, 211
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
