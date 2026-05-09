; DESCRIPTION: Renders a white line between points (33, 224) and (111, 16).
; PLAN: r0=33(x1), r1=224(y1), r2=111(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 224
LDI r2, 111
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
