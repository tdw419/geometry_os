; DESCRIPTION: Renders a white line between points (224, 83) and (306, 16).
; PLAN: r0=224(x1), r1=83(y1), r2=306(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 83
LDI r2, 306
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
