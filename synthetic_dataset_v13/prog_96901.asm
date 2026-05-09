; DESCRIPTION: Renders a white line between points (403, 229) and (459, 224).
; PLAN: r0=403(x1), r1=229(y1), r2=459(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 229
LDI r2, 459
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
