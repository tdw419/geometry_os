; DESCRIPTION: Renders a yellow line between points (447, 243) and (486, 224).
; PLAN: r0=447(x1), r1=243(y1), r2=486(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 243
LDI r2, 486
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
