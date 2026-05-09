; DESCRIPTION: Renders a white line between points (36, 127) and (224, 199).
; PLAN: r0=36(x1), r1=127(y1), r2=224(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 127
LDI r2, 224
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
