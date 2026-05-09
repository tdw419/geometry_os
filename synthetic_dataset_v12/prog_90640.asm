; DESCRIPTION: Renders a yellow line between points (392, 124) and (285, 224).
; PLAN: r0=392(x1), r1=124(y1), r2=285(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 124
LDI r2, 285
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
