; DESCRIPTION: Draws a blue line from (439, 228) to (56, 34).
; PLAN: r0=439(x1), r1=228(y1), r2=56(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 228
LDI r2, 56
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
