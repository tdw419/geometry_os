; DESCRIPTION: Renders a white line between points (304, 32) and (25, 224).
; PLAN: r0=304(x1), r1=32(y1), r2=25(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 32
LDI r2, 25
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
