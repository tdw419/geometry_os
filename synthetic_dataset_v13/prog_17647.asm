; DESCRIPTION: Draws a blue line from (300, 228) to (439, 50).
; PLAN: r0=300(x1), r1=228(y1), r2=439(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 228
LDI r2, 439
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
