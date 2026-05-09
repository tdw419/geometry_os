; DESCRIPTION: Renders a green line between points (79, 30) and (363, 198).
; PLAN: r0=79(x1), r1=30(y1), r2=363(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 30
LDI r2, 363
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
