; DESCRIPTION: Draws a green line from (299, 120) to (150, 163).
; PLAN: r0=299(x1), r1=120(y1), r2=150(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 120
LDI r2, 150
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
