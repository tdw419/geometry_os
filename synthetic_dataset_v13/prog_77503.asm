; DESCRIPTION: Draws a white line from (262, 189) to (6, 231).
; PLAN: r0=262(x1), r1=189(y1), r2=6(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 189
LDI r2, 6
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
