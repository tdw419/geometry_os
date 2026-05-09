; DESCRIPTION: Draws a magenta line from (439, 38) to (349, 120).
; PLAN: r0=439(x1), r1=38(y1), r2=349(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 38
LDI r2, 349
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
