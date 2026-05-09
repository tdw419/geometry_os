; DESCRIPTION: Draws a green line from (274, 243) to (367, 120).
; PLAN: r0=274(x1), r1=243(y1), r2=367(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 243
LDI r2, 367
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
