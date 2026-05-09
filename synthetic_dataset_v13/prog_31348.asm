; DESCRIPTION: Renders a white line between points (7, 224) and (346, 64).
; PLAN: r0=7(x1), r1=224(y1), r2=346(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 224
LDI r2, 346
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
