; DESCRIPTION: Draws a white line from (10, 89) to (228, 231).
; PLAN: r0=10(x1), r1=89(y1), r2=228(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 89
LDI r2, 228
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
