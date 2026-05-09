; DESCRIPTION: Renders a green line between points (85, 248) and (367, 134).
; PLAN: r0=85(x1), r1=248(y1), r2=367(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 248
LDI r2, 367
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
