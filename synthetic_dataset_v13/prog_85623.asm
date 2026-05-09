; DESCRIPTION: Renders a black line between points (335, 226) and (127, 224).
; PLAN: r0=335(x1), r1=226(y1), r2=127(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 226
LDI r2, 127
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
