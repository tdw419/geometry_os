; DESCRIPTION: Draws a white line from (440, 243) to (429, 33).
; PLAN: r0=440(x1), r1=243(y1), r2=429(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 243
LDI r2, 429
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
