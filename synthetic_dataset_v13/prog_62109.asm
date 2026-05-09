; DESCRIPTION: Renders a green line between points (492, 61) and (120, 178).
; PLAN: r0=492(x1), r1=61(y1), r2=120(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 61
LDI r2, 120
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
