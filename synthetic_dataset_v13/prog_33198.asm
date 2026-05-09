; DESCRIPTION: Renders a green line between points (28, 205) and (224, 233).
; PLAN: r0=28(x1), r1=205(y1), r2=224(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 205
LDI r2, 224
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
