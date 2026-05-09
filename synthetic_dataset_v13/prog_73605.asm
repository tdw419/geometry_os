; DESCRIPTION: Places a red line segment connecting (63, 206) to (434, 150).
; PLAN: r0=63(x1), r1=206(y1), r2=434(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 206
LDI r2, 434
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
