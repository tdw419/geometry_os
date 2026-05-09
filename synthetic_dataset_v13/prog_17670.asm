; DESCRIPTION: Draws a white line from (249, 63) to (270, 177).
; PLAN: r0=249(x1), r1=63(y1), r2=270(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 63
LDI r2, 270
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
