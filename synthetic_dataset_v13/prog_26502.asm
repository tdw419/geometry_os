; DESCRIPTION: Draws a magenta line from (308, 20) to (246, 55).
; PLAN: r0=308(x1), r1=20(y1), r2=246(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 20
LDI r2, 246
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
