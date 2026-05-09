; DESCRIPTION: Renders a white line between points (346, 92) and (318, 224).
; PLAN: r0=346(x1), r1=92(y1), r2=318(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 92
LDI r2, 318
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
